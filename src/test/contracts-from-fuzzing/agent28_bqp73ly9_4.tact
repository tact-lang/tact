struct Inner {
    s: String;
    b: Bool?;
}

struct Outer {
    intField: Int;
    addrOpt: Address?;
    innerStruct: Inner;
}

contract NestedOptionalStruct {
    st: Outer;

    init() {
        self.st = Outer{
            intField: 5,
            addrOpt: null,
            innerStruct: Inner{
                s: "hi",
                b: null,
            },
        };
    }
}