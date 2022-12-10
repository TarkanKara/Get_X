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
* **Peki, bir **Obx** içinde 5 Rx (gözlemlenebilir) değişkenim varsa ne olur?**
  * Sadece herhangi biri değiştiğinde güncellenecektir.
* **Ve bir sınıfta 30 değişkenim varsa, birini güncellediğimde, o sınıftaki tüm değişkenleri günceller mi?**
  * Hayır, yalnızca o Rx değişkenini kullanan belirli Widget.
  * Rx değişkeni değeri değiştirdiğinde günceller.
  * Rx değişkeninin" durumunu dinleyebilirsiniz, çünkü içindeki her şey Streams.
  * Kelimenin tam anlamıyla bir BLoC yaklaşımıdır, MobX'ten daha kolaydır ve code generators veya decorations yoktur. Sadece bir ".obs" ile her şeyi "Gözlemlenebilir" hale getirebilirsiniz.

## Declaring a reactive variable
* Bir değişkeni **observable** (gözlemlenebilir) hale getirmenin 3 yolu vardır.

  1. İlki, **Rx{Type}** kullanmaktır.

```dart
//başlangıç ​​değeri önerilir, ancak zorunlu değildir.
final name = RxString('');
final isLogged = RxBool(false);
final count = RxInt(0);
final balance = RxDouble(0.0);
final items = RxList<String>([]);
final myMap = RxMap<String, int>({});
```
  2. kincisi, **Rx** kullanmak ve Darts Generics (dart veri tipleri), Rx<Type> kullanmaktır.

```dart
final name = Rx<String>('');
final isLogged = Rx<Bool>(false);
final count = Rx<Int>(0);
final balance = Rx<Double>(0.0);
final number = Rx<Num>(0)
final items = Rx<List<String>>([]);
final myMap = Rx<Map<String, int>>({});

//Özel sınıflar - kelimenin tam anlamıyla herhangi bir sınıf olabilir
final user = Rx<User>();
```
  3. Üçüncü, daha pratik, daha kolay ve tercih edilen yaklaşım, değerinizin bir özelliği olarak **".obs"**'u eklemeniz yeterli

```dart
final name = ''.obs;
final isLogged = false.obs;
final count = 0.obs;
final balance = 0.0.obs;
final number = 0.obs;
final items = <String>[].obs;
final myMap = <String, int>{}.obs;

//Özel sınıflar - kelimenin tam anlamıyla herhangi bir sınıf olabilir
final user = User().obs;
```

## [Simple State Manager](https://chornthorn.github.io/getx-docs/state-management/simple-state-manager/index)
* Getx, ChangeNotifier kullanmayan, özellikle Flutter'a yeni başlayanların ihtiyacını karşılayacak, büyük uygulamalar için sorun yaratmayacak, son derece hafif ve kolay bir durum yöneticisine (state manager) sahiptir.
* **GetBuilder** tam olarak çoklu durum kontrolünü hedefliyor.
* Bir sepete 30 ürün eklediğinizi, birini sil'e tıkladığınızı, aynı anda listenin güncellendiğini, fiyatın güncellendiğini ve alışveriş sepetindeki toplam fiyatın daha küçük bir sayı ile güncellendiğini düşünün.
* Bu tür bir yaklaşım, **GetBuilder'ı** öldürücü yapar, çünkü durumları gruplandırır ve bunun için herhangi bir "hesaplama mantığı (computational logic)" olmadan hepsini aynı anda değiştirir.
* **GetBuilder,** bu tür durumlar göz önünde bulundurularak oluşturuldu, çünkü geçici durum değişikliği için setState'i kullanabilirsiniz ve bunun için bir durum yöneticisine (state manager) ihtiyacınız olmaz.
* **Advantages**
  * Yalnızca gerekli widget'ları güncelleyin
  * changeNotifier kullanmaz, daha az bellek kullanan (0mb'ye yakın) durum yöneticisidir.
  * StatefulWidget'ı unutun! Getx ile buna asla ihtiyacınız olmayacak. Çünkü **GetBuilder** var.
  * Stateless widgette bir durumu güncellemek için GetBuilder ile sarmalamamız gerekecek.
  * **GetBuilder,** tıpkı StatefulWidget gibi **"initState"** özelliğine sahiptir
  * GetBuilder ayrıca, dispose özelliğine de sahiptir

```dart
class Controller extends GetxController {
  int counter = 0;
  void increment() {
    counter++;
    update(); 
    // increment() metodu çağrıldığında kullanıcı arayüzündeki sayaç değişkenini güncellemek için update() işlevini kullanın
  }
}

class OtherClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<Controller>(
          builder: (s) => Text('${s.counter}'),
        ),
      ),
    );
  }
```





