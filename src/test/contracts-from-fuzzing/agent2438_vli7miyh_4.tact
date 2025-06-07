struct ParamWithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
    d: Int?;  
}

contract DefaultsTest {
    param: ParamWithDefaults;

    init() {
        self.param = ParamWithDefaults{ d: null };
    }
}
