struct InnerStruct {
    foo: Int;
}

struct MiddleStruct {
    inner: InnerStruct;
}

struct OuterStruct {
    middle: MiddleStruct;
}

contract TestContract {
    state: OuterStruct;

    init() {
        self.state = OuterStruct{
            middle: MiddleStruct{
                inner: InnerStruct{
                    foo: 77
                }
            }
        };
    }
}
