struct Inner1 {
    a: Int;
    b: Bool?;
}

struct Inner2 {
    c: String;
    d: Address?;
}

struct TopLevel {
    i1: Inner1;
    i2: Inner2;
}

contract MultiInnerStructs {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            i1: Inner1{ a: 5, b: null },
            i2: Inner2{ c: "str", d: null }
        };
    }
}