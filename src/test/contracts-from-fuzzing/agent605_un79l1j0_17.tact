struct Opts {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract Holder3Opt {
    val: Opts;

    init() {
        self.val = Opts{
            a: null,
            b: null,
            c: null
        };
    }
}