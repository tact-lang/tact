struct InnerSt {
    inside: Int;
}

contract DeeplyNestedOptionals {
    optStruct: InnerSt?;

    init() {
        self.optStruct = null;
    }
}