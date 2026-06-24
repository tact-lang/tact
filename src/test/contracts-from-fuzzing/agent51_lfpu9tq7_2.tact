struct NestedStruct {
    nestedInt: Int;
    optionalString: String?;
}

contract TestNestedStruct {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            nestedInt: 5,
            optionalString: "test",
        };
    }
}
