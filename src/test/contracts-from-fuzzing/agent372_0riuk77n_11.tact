struct S1 { a: Int; }
struct S2 {
    nestedOpt: S1?;
    flag: Bool;
}

contract OptionalStructInStruct {
    data: S2;

    init() {
        self.data = S2{
            nestedOpt: null,
            flag: true
        };
    }
}