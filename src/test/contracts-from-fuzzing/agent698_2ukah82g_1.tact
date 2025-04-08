struct NestedStruct {
    x: Int;
    y: Int?;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            x: 5,
            y: null,
        };
    }
}