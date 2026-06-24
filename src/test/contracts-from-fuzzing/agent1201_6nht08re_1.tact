struct DeepNested {
    inner: InnerStruct; 
}

struct InnerStruct {
    optVal: OptionalStruct?;
}

struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    state: DeepNested;

    init() {
        self.state = DeepNested{
            inner: InnerStruct{
                optVal: null
            }
        };
    }
}