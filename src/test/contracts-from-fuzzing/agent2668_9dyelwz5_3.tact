struct DeepA { x: Int; }
struct DeepB { inner: DeepA; flag: Bool; }
struct DeepC { deep: DeepB; y: Int; }

contract DeepNestedTest {
    data: DeepC;

    init() {
        self.data = DeepC{ deep: DeepB{ inner: DeepA{ x: 7 }, flag: true }, y: 9 };
    }
}
