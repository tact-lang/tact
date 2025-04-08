struct MixDefaultOpt {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: String = "s";
    f: String?;
}

contract MixFields {
    data: MixDefaultOpt;

    init() {
        self.data = MixDefaultOpt{
            b: null,
            d: null,
            f: null
        };
    }
}
