struct SimpleOptional {
    s: String?;
    n: Int?;
    f: Bool?;
}

contract OptStruct {
    val: SimpleOptional;

    init() {
        self.val = SimpleOptional{
            s: null,
            n: null,
            f: null
        };
    }
}