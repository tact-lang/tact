struct Inner {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Address?;
    f: String?;
}

contract StructInStorage {
    inner: Inner = Inner{ a:1, b:true, c:"hi", d:null, e:null, f:null };

    init() {
        self.inner = Inner{ a:42, b:false, c:"world", d:123, e:myAddress(), f:"test" };
    }
}
