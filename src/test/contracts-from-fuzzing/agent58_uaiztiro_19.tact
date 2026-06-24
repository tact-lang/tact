struct S1 {
    n: Int;
}

struct S2 {
    opt: S1?;
}

contract OptionalStructInStruct {
    data: S2;

    init() {
        self.data = S2{
            opt: null
        };
    }
}