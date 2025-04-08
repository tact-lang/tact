struct OptionalDeep {
    deep: InnerDeep?;
}

struct InnerDeep {
    s: String?;
    b: Bool?;
}

contract TestContract {
    optDeep: OptionalDeep;

    init() {
        self.optDeep = OptionalDeep{ deep: InnerDeep{ s: null, b: true } };
    }
}
