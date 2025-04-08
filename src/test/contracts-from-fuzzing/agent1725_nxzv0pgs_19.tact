struct Deep {
    f1: Int;
    f2: String?;
    f3: Int?;
    f4: Bool;
    f5: Bool?;
    f6: String;
}

contract TestContract {
    var1: Int;
    var2: Bool;
    var3: String;
    deep: Deep;

    init() {
        self.var1 = 10;
        self.var2 = true;
        self.var3 = "hi";
        self.deep = Deep{
            f1: 1,
            f2: "abc",
            f3: null,
            f4: false,
            f5: null,
            f6: "xyz",
        };
    }
}