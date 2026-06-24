struct InnerStruct {
    s: String;
    b: Bool;
}

contract OptionalNestedStruct {
    f: InnerStruct?;

    init() {
        self.f = InnerStruct{s: "hey", b: true};
    }
}
