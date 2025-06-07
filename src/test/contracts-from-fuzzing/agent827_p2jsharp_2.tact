struct MyStruct {
    a: Int;
    b: Int?;
    c: String?;
}

contract OptImplicit {
    data: MyStruct = MyStruct{
        a: 7,
        // omitted optional fields
    };

    receive() {
        self.data = MyStruct{
            a: 8,
            b: null,
            c: "x"
        };
    }
}