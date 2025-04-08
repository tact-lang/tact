struct NestedStruct {
    nestedInt: Int;
    nestedBool: Bool;
    nestedOpt: Int?;
}

contract StructInStorage {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            nestedInt: 5,
            nestedBool: true,
            nestedOpt: null,
        };
    }
}