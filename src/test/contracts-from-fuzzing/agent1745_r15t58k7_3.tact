struct OptionalStruct {
    foo: Int;
    bar: Int?;
}

contract OptionalFieldStorage {
    myStruct: OptionalStruct;

    init() {
        self.myStruct = OptionalStruct{
            foo: 10,
            bar: null
        };
    }
}