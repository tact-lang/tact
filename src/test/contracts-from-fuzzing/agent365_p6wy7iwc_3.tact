struct InnerOptional {
    x: Int?;
    y: Int?;
}

contract OptionalStruct {
    data: InnerOptional;
    init() {
        self.data = InnerOptional{x: null, y: 7};
    }
}