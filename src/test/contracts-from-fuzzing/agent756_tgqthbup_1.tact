struct InnerStruct {
    nestedInt: Int;
    optionalString: String?;
}

contract TestContract {
    myStruct: InnerStruct;

    init() {
        self.myStruct = InnerStruct{
            nestedInt: 1,
            optionalString: "hello",
        };
    }
}