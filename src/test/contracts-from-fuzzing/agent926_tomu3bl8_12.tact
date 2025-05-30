struct InnerStruct {
    val: Int;
}

struct MiddleStruct {
    nested1: InnerStruct?;
    nested2: InnerStruct?;
    nested3: InnerStruct?;
    nested4: InnerStruct?;
    nested5: InnerStruct?;
}

contract TestContract {
    state: MiddleStruct;

    init() {
        self.state = MiddleStruct{
            nested1: null,
            nested2: null,
            nested3: null,
            nested4: null,
            nested5: null
        };
    }
}