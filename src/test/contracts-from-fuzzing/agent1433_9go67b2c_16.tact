struct InnerOptStruct {
    inner: String?;
}

struct MidLevel {
    a: Int;
    b: InnerOptStruct;
}

struct Outer {
    x: MidLevel;

}

contract NestedOptionalFields {
    storage: Outer;

    init() {
        self.storage = Outer{
            x: MidLevel{
                a: 1,
                b: InnerOptStruct{ inner: null }
            }
        };
    }
}
