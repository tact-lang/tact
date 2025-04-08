struct OptionalDeep {
    deep: OptionalDeeper?;
}

struct OptionalDeeper {
    a: Int;
    b: Bool;
}

contract TestContract {
    x: OptionalDeep;
    init() {
        self.x = OptionalDeep{ deep: OptionalDeeper{ a: 1, b: true } };
    }
}