struct Opts {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
}

contract TestOptNested {
    val: Opts?;

    init() {
        self.val = Opts{
            i: 1,
            b: false,
            s: null,
            a: null
        };
    }
}