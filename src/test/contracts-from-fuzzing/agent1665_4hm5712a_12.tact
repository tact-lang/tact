struct Mixed {
    i: Int;
    b: Bool;
    s: String;
    optI: Int?;
    optB: Bool?;
    optS: String?;
}

contract Test12 {
    data: Mixed;

    init() {
        self.data = Mixed{
            i: 7,
            b: true,
            s: "hi",
            optI: null,
            optB: false,
            optS: null
        };
    }
}