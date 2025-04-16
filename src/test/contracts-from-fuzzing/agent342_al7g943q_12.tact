struct MixDefaultAndOption {
    a: Int = 1;
    b: Bool = false;
    c: Int?;
    d: Bool?;
    e: String = "x";
    f: String?;
}

contract MixDefaultOptionContract {
    val: MixDefaultAndOption;

    init() {
        self.val = MixDefaultAndOption{
            c: null,
            d: null,
            f: null,
        };
    }
}
