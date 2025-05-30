struct ABoolInt {
    a: Int;
    b: Bool;
}

struct WithOptStruct {
    s: ABoolInt?;
    flag: Bool;
}

contract StructWithOptionalStruct {
    f: WithOptStruct;
    init() {
        self.f = WithOptStruct{
            s: null,
            flag: true,
        };
    }
}