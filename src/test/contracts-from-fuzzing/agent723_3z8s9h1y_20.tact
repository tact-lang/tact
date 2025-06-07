struct Intermediate {
    deep: DeepNested?;
}

struct DeepNested {
    val: Int;
}

contract TestContract {
    state: Intermediate;

    init() {
        self.state = Intermediate{ deep: null };
    }
}