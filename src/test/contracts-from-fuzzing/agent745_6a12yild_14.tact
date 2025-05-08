struct Mid {
    v: Int;
}

struct Outer {
    m: Mid;
    s: String;
}

contract StructWithStruct {
    st: Outer;

    init() {
        self.st = Outer{
            m: Mid{ v: 5 },
            s: "nested"
        };
    }
}