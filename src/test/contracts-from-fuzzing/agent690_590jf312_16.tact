struct MixedDefault {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Int?;
    e: String?;
    f: Bool?;
}

contract Defaulted {
    val: MixedDefault;

    init() {
        self.val = MixedDefault{
            d:null,
            e:null,
            f:null
        };
    }
}