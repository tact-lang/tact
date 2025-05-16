struct S1 {
    f1: String;
}

struct S2 {
    s1: S1;
    f2: Int;
}

contract StructInStruct {
    data: S2;

    init() {
        self.data = S2{
            s1: S1{
                f1: "hello",
            },
            f2: 101,
        };
    }
}