struct Inner {
    flag: Bool;
    str: String;
    optI: Int?;
    optS: String?;
}

contract Mixed {
    i: Int = 1;
    b: Bool = false;
    s: String = "str";
    optB: Bool?;
    optStr: String?;
    nested: Inner;

    init() {
        self.optB = null;
        self.optStr = null;
        self.nested = Inner{
            flag: true,
            str: "n",
            optI: null,
            optS: null,
        };
    }

    receive() {}
}