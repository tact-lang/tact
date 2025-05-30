struct SomeStruct {
    a: Int;
    b: String;
}

contract OptStructInit {
    data: SomeStruct?;

    init() {
        self.data = SomeStruct{
            a: 5,
            b: "hi",
        };
    }
}