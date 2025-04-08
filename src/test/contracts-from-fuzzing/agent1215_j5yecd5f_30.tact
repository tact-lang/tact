struct WithStr {
    a: Int = 1;
    b: String = "hello";
    c: String?;
}

contract TestStrDefault {
    param: WithStr;

    init() {
        self.param = WithStr{ c: null };
    }
}