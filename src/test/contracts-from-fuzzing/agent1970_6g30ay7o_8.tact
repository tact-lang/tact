struct S1 {
    a: Int;
    b: Bool?;
}

struct S2 {
    ab: S1;
    c: String;
}

contract OptionalStruct {
    ptr: S2?;

    init() {
        self.ptr = S2{
            ab: S1{a: 1, b: null},
            c: "hi"
        };
    }
}