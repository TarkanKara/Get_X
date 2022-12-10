## Counter App with GetX
1. MaterialApp i GetMaterialApp ile değiştirelim.

```dart
dependencies:
  void main() => runApp(GetMaterialApp(home: Home()));
```

:bangbang:

* **GetMaterialApp,** Flutter'ın MaterialApp'ını değiştirmez.
* **GetMaterialApp,** MaterialApp'e sahip önceden yapılandırılmış bir Widget'tır.
* **GetMaterialApp** **rotalar** oluşturacak, **enjekte** edecek, **çevirileri** (translations) enjekte edecek, **rota navigasyonu** için ihtiyacınız olan her şeyi enjekte edecek.
* **Get'i** yalnızca durum yönetimi **(state management)** veya bağımlılık yönetimi **(dependency management)** için kullanıyorsanız, **GetMaterialApp** kullanmanıza gerek yoktur.
* **GetMaterialApp** rotalar **(necessary for routes),** snackbar'lar **(snackbars),** **bottomSheets,** **dialogs,** **rotalar** ve **üst düzey api'ler** için gereklidir.
*  Yalnızca rota yönetimini **(Get.to(), Get.back() vb.)** kullanacaksanız GetMaterialApp gereklidir.

2. **[Business logic class](https://github.com/TarkanKara/Get_X/blob/master/lib/Getx_1_counter/controller.dart)** ı oluşturalım. Tüm **variables,** **methods** ve **controller** i yerleştirelim. Basit bir **".obs"** kullanarak herhangi bir değişkeni (variables) gözlemlenebilir hale getirebilirsiniz.

```dart
class Controller extends GetxController{
  var count = 0.obs;
  increment() => count++;
}
```

3. StatelessWidget'ı kullanın ve biraz RAM den tasaruf sağlayalım, **GetX** ile artık **StatefulWidget** kullanmanıza gerek kalmayabilir. 
* controller adında bir değişkeni Controller sınıfından oluşturarak. Controller sınıfındaki özellikleri **Get.put()** kullanarak tüm sayfalarımızda kullanabilelim.

```dart
final Controller controller = Get.put(Controller());
```

4. Sayı her değiştiğinde Text i güncellemek için **[Obx()](https://github.com/TarkanKara/Get_X/blob/master/lib/Getx_1_counter/home_page.dart)** kullanalım.

```dart
Obx(() => Text("Tıklanma : ${controller.count}"))
```

5. Navigator.push'u basit bir **Get.to()** ile değiştirin. Context e ihtiyacınız yok.

```dart
ElevatedButton(
    onPressed: () {
        Get.to(const SecondPage());
        },
        child: const Text("Diğer Sayfa Geç")),
```

6. Butona controller sınıfının içerisindeki **increment()** metodunu tanımlayalım.

```dart
floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.icrement();
          },
          child: const Icon(Icons.add)),
```

7. Home page sayfasında **Get.put()** kullanmıştık. Second Page sayfasında conroller e erişebilmek için bu sefer **Get.find()** kullanıyoruz.

```dart
final Controller controller = Get.find();
```
:stuck_out_tongue_winking_eye:

8. Get is not for everyone, but if you identified with that phrase, Get is for you!




