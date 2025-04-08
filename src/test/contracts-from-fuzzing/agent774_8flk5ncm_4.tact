struct Inner {
    val: Int?;
    txt: String;
    flag: Bool?;
}

struct Another {
    nested: Inner;
    check: Bool;
    message: String?;
}

contract OptFields {
    data: Another;
    init() {
        self.data = Another{
            nested: Inner{ val: null, txt: "", flag: null },
            check: true,
            message: null
        };
    }
}