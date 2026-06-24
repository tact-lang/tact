struct OptStruct {
    foo: Int?;
    bar: Bool?;
    txt: String;
}

contract OptStructField {
    data: OptStruct?;

    init() {
        self.data = OptStruct{
            foo: 42,
            bar: true,
            txt: "hello",
        };
    }
}
