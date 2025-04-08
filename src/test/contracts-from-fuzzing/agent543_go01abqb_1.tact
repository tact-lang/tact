struct InnerStruct {
    a: Int;
    b: Bool;
}

contract DeepOptional {
    s: InnerStruct?;

    init() {
        self.s = null;
    }
}