struct Opts {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
}

contract MidOptional {
    val: Opts?;

    init() {
        self.val = Opts{
            a:null,
            b:null,
            c:null,
            d:null
        };
    }
}