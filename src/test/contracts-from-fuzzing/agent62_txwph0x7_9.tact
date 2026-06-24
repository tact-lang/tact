struct DeepNested { i: Int; s: String; }
struct L2 { deep: DeepNested; }
struct L1 { inner: L2; }

contract TestContract {
    f: L1;

    init() {
        self.f = L1{ inner: L2{ deep: DeepNested{ i: 42, s: "hi" } } };
    }
}