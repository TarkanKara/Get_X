## [GetX](https://chornthorn.github.io/getx-docs/index)
* **GetX,** basit ve pratik bir şekilde yüksek performanslı
    * **State management** (durum yönetimi) 
    * **Dependency injection** (bağımlılık enjeksiyonu) 
    * **Route management** (rota yönetimi) ile *Flutter için* ekstra kolay ve güçlü bir çözümdür.

* **GetX'in** *3 temel prensibi* vardır. Bunlar;
    - **PERFORMANCE** (performans)
    - **PRODUCTIVITY** (verimlilik)
    - **ORGANIZATION** (organizasyon)

 **PERFORMANCE:**
   - Performansa ve minimum kaynak tüketimine odaklanmıştır.
   - GetX, Stream veya ChangeNotifier'ı kullanmaz.
   - **StatelessWidget** kullanıldığı, **StatefulWidget** kullanmayı gerektirmediği için daha performanslı çalışır.

 **PRODUCTIVITY:**
   - Daha kolay ve anlaşılır bir syntax kullanır.
   - Daha az kod kullanarak işlemlerinizi daha hızlı yapmanıza olanak sağlar.
   - Geliştirici olarak kontrolleri bellekten kaldırma işlemleri yapılması gerekir.GetX ile buna gerek yoktur.
   - Çünkü GetX'te varsayılan olarak kullanılmayan kontroller bellekten kaldırılır ve bu bize hem hız hem de verimlilik sağlar.
   - Bellekte tutulması istenilen bağımlılıklar (dependency) varsa **"permanent: true"** olarak belirtmelidir.
   - Bağımlılıkların belleğe yüklenmesi default olarak **lazy** yani kullanılıyorsa yüklenir, kullanılmıyorsa kaldırılır şeklinde gelmektedir.

 **ORGANIZATION:**
   - **View, presentation logic (sunum mantığı), business logic (iş mantığı), dependency injection ve navigation** işlemlerinin tamamen ayrıştırılmasına izin verir.
   - Rotalar arasında gezinmek için **context'e** ihtiyaç yoktur.
   -  Bunun için widget ağacına **(visualization)** bağımlılığı yoktur. 
   -  Controllers, Models, Blocs sınıfları MultiProviders aracılığıyla widget ağacına enjekte etmeye gerek yoktur. 
   - Bunun için GetX, kendine özgü dependency injection özelliğini kullanır. 

## [Installing](https://pub.dev/packages/get#installing)
- Get'i pubspec.yaml dosyanıza ekleyin:

```dart
dependencies:
  get: ^4.6.5
```

## [State Management](https://chornthorn.github.io/getx-docs/state-management/index)
* GetX, diğer state managment gibi Streams veya ChangeNotifier'ı kullanmaz.
* **Complexity:**
  * GetX ile her event için bir sınıf tanımlamanız gerekmez, kod son derece temiz ve anlaşılırdır ve daha az yazarak çok daha fazlasını yaparsınız.
* **No code generators:**
  * Bazı state managers, minimum düzeyde okunabilir koda sahip olmak için kod oluşturuculara (code generators) güvenir.
  * Bir değişkeni değiştirmek ve build_runner'ı çalıştırmak zorunda olmak verimsiz olabilir. Bekleme süresi uzun olabiliyor.
  * GetX ile her şey reaktiftir ve hiçbir şey kod oluşturuculara (code generators) bağlı değildir,
* **It does not depend on context:**
  * Kelimenin tam anlamıyla hiçbir şey için veriyi context e göre göndermeniz gerekmez.
* **Granular control:**
  * Çoğu state managers ChangeNotifier'a dayalıdır.
  * ChangeNotifier, notifyListeners çağrıldığında ona bağlı olan tüm widget'ları bilgilendirir.
  * Bir ekranda ChangeNotifier sınıfınızın bir değişkenine sahip 40 widget'ınız varsa, birini güncellediğinizde tümü yeniden oluşturulur.
  * GetX ile iç içe geçmiş widget'lara bile saygı duyulur.
* **It only reconstructs if its variable REALLY changes**

## [Reactive State Manager](https://chornthorn.github.io/getx-docs/state-management/reactive-state-manager/index)
* GetX'in iki farklı durum yöneticisi vardır: Basit durum yöneticisi **(GetBuilder)** ve reaktif durum yöneticisi **(GetX / Obx)**.
* GetX, reaktif programlamayı oldukça basit bir hale dönüştürür.
  * StreamControllers oluşturmak gerekmez
  * Her değişken için bir StreamBuilder oluşturmak gerekmez. 
  * Her state için bir sınıf oluşturmak gerekmez. 
  * Başlangıç ​​değeri için bir get oluşturmak gerekmez.
  * Kod generators kullanmaya gerek kalmaz

* Bu değişkeni **observable** yani gözlemlenebilir hale getirmek için, sonuna **".obs"** eklememiz yeterlidir.

```dart
var hello_world = "Hello World".obs;
```
* Veri her değiştiğinde Text()'i güncellemek için **Obx** widgeti ile sarmalıyoruz

```dart
Obx(() => Text("${controller.hello_world}"));
```
:bangbang:

* **hello_world** adında bir değişken tanımladık ve değerinin **"Hello World"** olduğunu söyledik. ve **".obs"** ile değişkeni gözlenebilir olduğunu söyledik. bu değişkenin değeri önceki değeri ile aynı olduğu durumda ekranda hiçbir şey değişmeyecek ve **".obx"** yeni değeri yok sayar ve Widgetı yeniden oluşturmaz. **Isn't that amazing?** 
* Peki, bir **Obx** içinde 5 Rx (gözlemlenebilir) değişkenim varsa ne olur?
  * Sadece herhangi biri değiştiğinde güncellenecektir.
* Ve bir sınıfta 30 değişkenim varsa, birini güncellediğimde, o sınıftaki tüm değişkenleri günceller mi?
  * Hayır, yalnızca o Rx değişkenini kullanan belirli Widget.
  * Rx değişkeni değeri değiştirdiğinde günceller.




