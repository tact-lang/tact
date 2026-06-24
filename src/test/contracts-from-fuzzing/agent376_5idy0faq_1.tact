struct InnerStruct {
    x: Int;
    y: Int?;
}

contract DeepOptionalNested {
    coord: InnerStruct?;

    init() {
        self.coord = null;
    }
}