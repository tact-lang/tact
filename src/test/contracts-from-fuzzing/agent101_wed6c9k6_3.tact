struct DefaultsOptional {
    val: Int = 5;
    opt: Bool?;
    strOpt: String? = null;
}

contract TestDefaults {
    data: DefaultsOptional;

    init() {
        self.data = DefaultsOptional{
            val: 42,
            opt: true,
            strOpt: "hello",
        };
    }
}