struct BigStruct {
    f1: Int = 1;
    f2: Bool = false;
    f3: Int?;
    f4: Bool?;
    f5: Int = 5;
    f6: String = "foo";
    f7: String?;
    f8: Bool = true;
    f9: Int?;
    f10: String = "bar";
}

contract BigFields {
    s: BigStruct = BigStruct{
        f3: null,
        f4: null,
        f7: null,
        f9: null
    };

    receive() {
        self.s = BigStruct{
            f1: 100,
            f2: true,
            f3: 42,
            f4: false,
            f5: 105,
            f6: "bang",
            f7: "opt",
            f8: false,
            f9: null,
            f10: "baz"
        };
    }
}