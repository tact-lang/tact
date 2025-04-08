struct Struct1 {
    i: Int;
    b: Bool;
}

struct Struct2 {
    s1: Struct1;
    text: String?;
}

contract NestedSerial {
    s: Struct2;

    init() {
        self.s = Struct2{
            s1: Struct1{ i: 11, b: true },
            text: null
        };
    }
}