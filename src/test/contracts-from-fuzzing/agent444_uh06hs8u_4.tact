struct Inner {
    x: Int;
    y: Bool;
}

struct Middle {
    a: Inner;
    b: Int?;
}

struct Outer {
    z: Middle;
    flag: Bool;
    txt: String;
}

contract NestedLevelsContract {
    store: Outer;

    init() {
        self.store = Outer{
            z: Middle{ a: Inner{ x: 7, y: true }, b: null },
            flag: false,
            txt: "deep",
        };
    }
}