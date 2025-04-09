// test optional nested inside optional struct
struct InnerOpt {
    val: Int?;
}

contract OptionalInside {
    val: InnerOpt?;

    init() {
        self.val = null;
    }
}