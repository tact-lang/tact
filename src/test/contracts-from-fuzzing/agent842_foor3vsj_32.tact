struct WithDefaults {
    a: Int = 123;
    b: Bool = false;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract DefaultedStruct {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }

    receive() {
        let _=self.data;
    }
}