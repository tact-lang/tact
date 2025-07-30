struct MyStruct {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell?;
    e: Address;
}

contract ComplexTypes {
    data: MyStruct;

    init() {
        self.data = MyStruct{
            a: 1,
            b: true,
            c: "hello",
            d: null,
            e: myAddress(),
        };
    }
}