struct InnerStruct {
    x: Int;
    y: Bool?;
}

contract TestDeepOptionalNested {
    data: InnerStruct?;

    init() {
        self.data = null;
    }
}