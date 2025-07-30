struct InnerStruct {
    a: Int;
    b: Bool;
}

contract NestedStructContract {
    coord: InnerStruct;

    init() {
        self.coord = InnerStruct{
            a: 1,
            b: true,
        };
    }
}
