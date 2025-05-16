struct MixStruct {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: String = "hi";
    f: String?;
}

contract TestContract {
    mixed: MixStruct;

    init() {
        self.mixed = MixStruct{
            b: null,
            d: null,
            f: null,
        };
    }
}