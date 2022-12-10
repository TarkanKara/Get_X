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

