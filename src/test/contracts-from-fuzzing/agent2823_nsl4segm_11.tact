struct InnerStruct {
    number: Int;
    flag: Bool;
}

struct OuterStruct {
    a: Int;
    b: InnerStruct;
    c: Bool?;
}

contract MixedTypes {
    state: OuterStruct;

    init() {
        self.state = OuterStruct {
            a: 5,
            b: InnerStruct { number: 42, flag: true },
            c: false
        };
    }
}