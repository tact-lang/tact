struct DeepNest3 {
    val: Int;
}

struct DeepNest2 {
    deep: DeepNest3;
}

struct DeepNest1 {
    mid: DeepNest2;
}

contract DeepNestTest {
    field: DeepNest1;

    init() {
        self.field = DeepNest1{ mid: DeepNest2{ deep: DeepNest3{ val: 42 } } };
    }
}
