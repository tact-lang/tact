struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct Outer {
    inn: InnerOpt;
    z: Int;
}

contract NestedOptStruct {
    s: Outer;

    init() {
        self.s = Outer{
            inn: InnerOpt{ x: 42, y: true },
            z: 100
        };
    }
}