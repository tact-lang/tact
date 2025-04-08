struct OptStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract Test5 {
    val: OptStruct;

    init() {
        self.val = OptStruct{
            foo: 7,
            bar: null,
            baz: "optional"
        };
    }
}