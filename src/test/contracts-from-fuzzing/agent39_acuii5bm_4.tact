struct OptionalNest {
    s1: Int?;
    s2: Int?;
    s3: Int?;
    flag: Bool;
}

contract Test {
    val: OptionalNest;

    init() {
        self.val = OptionalNest{
            s1: null,
            s2: null,
            s3: 33,
            flag: true,
        };
    }
}