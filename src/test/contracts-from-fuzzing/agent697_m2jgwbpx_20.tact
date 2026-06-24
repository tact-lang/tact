struct Mix {
    intf: Int = 1;
    boolf: Bool = false;
    strf: String = "s";
    optInt: Int? = null;
    optBool: Bool? = null;
    optStr: String? = null;
}

contract Test {
    m: Mix = Mix{};

    init() {
        self.m = Mix{
            intf:42,
            boolf:true,
            strf:"x",
            optInt:99,
            optBool:true,
            optStr:"done"
        };
    }

    receive() {}
}