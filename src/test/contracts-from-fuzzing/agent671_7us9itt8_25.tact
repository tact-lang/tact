struct Inner {
    x: Int?;
}

struct Middle {
    inner: Inner;
    flag: Bool;
}

struct Outer {
    middleOpt: Middle?;
    name: String;
}

contract TestContract {
    compound: Outer;

    init() {
        self.compound = Outer{
            middleOpt: null,
            name: "compound opt"
        };
    }
}