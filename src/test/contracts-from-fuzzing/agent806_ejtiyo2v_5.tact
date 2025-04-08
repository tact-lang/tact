struct DeepOptional {
    maybeInner: InnerStruct?;
}

struct InnerStruct {
    val: Int;
    txt: String;
}

contract TestContract {
    optDeep: DeepOptional;
    init() {
        self.optDeep = DeepOptional {
            maybeInner: null
        };
    }
}