struct OptionalDeepStruct {
    nested: DeepStruct?;
}

struct DeepStruct {
    inner: Inner;
}

struct Inner {
    flag: Bool;
}

contract TestContract {
    optDeep: OptionalDeepStruct;
    
    init() {
        self.optDeep = OptionalDeepStruct{nested: null};
    }
}