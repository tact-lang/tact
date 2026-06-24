struct InnerStruct {
    flag: Bool = false;
    text: String = "default";
}

contract DefaultNested {
    nested: InnerStruct = InnerStruct{};
    init() {
        self.nested = InnerStruct{};
    }
}