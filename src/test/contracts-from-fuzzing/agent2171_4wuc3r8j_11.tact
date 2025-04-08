struct StringOptionalNest {
    s: String;
    t: String?;
}

contract StringMix {
    val: StringOptionalNest;

    init() {
        self.val = StringOptionalNest{
            s: "Hi",
            t: null
        };
    }
}