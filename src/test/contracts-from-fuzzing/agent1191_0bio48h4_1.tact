struct InnerStruct {
    a: Int;
    b: Bool;
}

contract DeepNestedOptionals {
    s: InnerStruct?;
    num: Int = 1;

    init() {
        self.s = null;
    }
}