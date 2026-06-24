struct NestedOptStruct {
    o: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
}

contract DoubleOptionalTest {
    nested: NestedOptStruct;

    init() {
        self.nested = NestedOptStruct{ o: InnerOpt{ x:null } };
    }
}