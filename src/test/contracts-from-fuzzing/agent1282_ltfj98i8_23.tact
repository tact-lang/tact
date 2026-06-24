// Testing repeated nested options of struct
struct InnerOpt {
    val: Int?;
}

contract RepeatedOptionalStructs {
    s1: InnerOpt?;
    s2: InnerOpt?;

    init() {
        self.s1 = null;
        self.s2 = null;
    }
}