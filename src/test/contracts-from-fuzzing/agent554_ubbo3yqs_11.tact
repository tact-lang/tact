struct NestedOptStruct {
    optStruct: InnerOptStruct?;
}

struct InnerOptStruct {
    flag: Bool;
}

contract NestedOptionStructTest {
    s: NestedOptStruct;

    init() {
        self.s = NestedOptStruct{
            optStruct: null
        };
    }
}