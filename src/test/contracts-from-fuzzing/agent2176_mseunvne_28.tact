struct Params {
    val: Int = 42;
    str: String = "abc";
}

contract ParamAssigned {
    p: Params;

    init() {
        self.p = Params{};
    }
}
