struct Middle {
    s: String;
    flag: Bool;
}

struct Outer {
    m: Middle;
    optInt: Int?;
}

contract StructStringOpt {
    data: Outer;

    init() {
        self.data = Outer{
            m: Middle{ s: "hi", flag: true },
            optInt: null
        };
    }
}