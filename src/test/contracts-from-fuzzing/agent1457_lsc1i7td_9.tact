struct Inner {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String;
    h: Address;
}

contract LargeStructField {
    val: Inner;

    init() {
        self.val = Inner{
            a:1, b:true, c:"x", d:myAddress(), e:null, f:null, g:"y", h:myAddress(),
        };
    }
}
