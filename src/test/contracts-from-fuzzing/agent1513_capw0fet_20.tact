struct OpStruct {
    val: Int?;
    addr: Address?;
    s: String?;
}

contract MultiOpt {
    foo: OpStruct;

    init() {
        self.foo = OpStruct{
            val: null,
            addr: null,
            s: "text"
        };
    }
}