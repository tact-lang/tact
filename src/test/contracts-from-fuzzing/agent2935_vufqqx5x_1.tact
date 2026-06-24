struct DeepNest3 { flag: Bool; val: Int }
struct DeepNest2 { entry: DeepNest3 }
struct DeepNest1 { inner: DeepNest2 }

contract DeepNestedStructTest {
    data: DeepNest1;

    init() {
        self.data = DeepNest1{ inner: DeepNest2{ entry: DeepNest3{ flag: true, val: 7 } } };
    }
}