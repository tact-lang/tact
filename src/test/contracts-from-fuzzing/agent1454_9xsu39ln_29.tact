struct Deepest {
    q: Int;
}

struct Middle {
    deep: Deepest;
}

struct Outer {
    mid: Middle = Middle{ deep: Deepest{ q: 5 } };
}

contract PartialDefaults {
    field: Outer;

    init() {
        self.field = Outer{};
    }
}