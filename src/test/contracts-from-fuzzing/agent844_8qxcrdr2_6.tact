struct ComplexOptional {
    val: Int?;
    str: String?;
    flag: Bool?;
}

struct WithDefaults {
    a: Int = 17;
    b: ComplexOptional;
    c: String = "Hey";
    d: Bool = true;
}

contract DefaultsCombination {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            b: ComplexOptional{
                val: null,
                str: null,
                flag: null,
            },
        };
    }

    receive() {
        let _ = self.data;
    }
}
