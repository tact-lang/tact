struct OnlyOpt {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract AllNulls {
    val: OnlyOpt;

    init() {
        self.val = OnlyOpt{
            a: null,
            b: null,
            c: null
        };
    }
}