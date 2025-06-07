struct Middle {
    s: String;
    n: Int;
}

struct Outer {
    mid: Middle;
    optionalBool: Bool?;
}

contract WithNestedStruct {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{ s: "hi", n: 100 },
            optionalBool: false
        };
    }
}