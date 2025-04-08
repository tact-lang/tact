struct Inner {
    a: Int as uint8;
    b: Bool?;
}

struct Middle {
    x: String;
    innerOpt: Inner?;
    num: Int as int32;
}

struct Outer {
    middleOpt: Middle?;
    flag: Bool;
}

contract ComplexStorage {
    data: Outer;

    init() {
        self.data = Outer{
            middleOpt: Middle{
                x: "yo",
                innerOpt: null,
                num: -1234
            },
            flag: false
        };
    }
}
