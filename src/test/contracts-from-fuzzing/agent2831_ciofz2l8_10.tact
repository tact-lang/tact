struct OptTwice {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptStruct {
    val: OptTwice;

    init() {
        self.val = OptTwice{
            a: null,
            b: null,
            c: null
        };
    }
}
