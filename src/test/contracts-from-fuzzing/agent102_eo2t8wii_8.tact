struct DefaultsOptional {
    a: Int = 5;
    b: String = "hi";
    c: Bool?;
}

contract DefaultsOptionalTest {
    defopt: DefaultsOptional;

    init() {
        self.defopt = DefaultsOptional{
            a: 10,
            b: "there",
            c: null
        };
    }
}