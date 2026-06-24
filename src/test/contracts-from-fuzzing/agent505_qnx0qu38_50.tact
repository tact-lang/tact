struct Strange {
    s1: String?;
    b: Bool = true;
    i: Int?;
    s2: String = "foo";
    bl: Bool?;
    j: Int = 5;
}

contract WeirdOrder {
    data: Strange = Strange{
        s1: null,
        b: false,
        i: null,
        s2: "bar",
        bl: null,
        j: 42
    };

    init() {
        self.data = self.data;
    }

    receive() {
        self.data = self.data;
    }
}