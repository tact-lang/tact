struct NestedStruct {
    s1: Inner1;
    s2: Inner2;
}

struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    c: String;
    d: Address;
}

contract Test {
    s: NestedStruct;

    init() {
        self.s = NestedStruct{
            s1: Inner1{
                a: 1,
                b: true,
            },
            s2: Inner2{
                c: "hi",
                d: myAddress(),
            },
        };
    }
}
