struct WithDefault {
    a: Int;
    b: String = "default string";
    c: Int?;
}

contract DefaultFieldStruct {
    wd: WithDefault;

    init() {
        self.wd = WithDefault{
            a: 42
            // omit b and c, should use default/null
        };
    }

    receive() {}
}