struct NoDefaults {
    a: Int;
    b: Bool;
    c: String;
    d: Address?;
}

contract NoDefaultInit {
    val: NoDefaults;

    init() {
        self.val = NoDefaults{
            a:42,
            b:true,
            c:"abc",
            d:null
        };
    }
}