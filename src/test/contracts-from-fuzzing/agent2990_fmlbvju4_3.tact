struct Inner {
    x: Int;
    y: String;
    flag: Bool?;
}

struct Middle {
    nested: Inner;
    note: String?;
}

struct Outer {
    deep: Middle;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{ deep: Middle{ nested: Inner{ x: 5, y: "s", flag: null }, note: null } };
    }
}