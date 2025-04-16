struct SomeStruct {
    a: Int;
    b: Bool;
}

contract TestInitOrder {
    data: SomeStruct;

    init() {
        self.data = SomeStruct{
            a: 5,
            b: true,
        };
        self.data = SomeStruct{
            a: 7,
            b: false,
        };
    }
}