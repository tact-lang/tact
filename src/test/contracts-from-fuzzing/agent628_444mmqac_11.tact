struct LoadsOfOpts {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract ManyOpts {
    val: LoadsOfOpts;

    init() {
        self.val = LoadsOfOpts{ a:null, b:null, c:null, d:null, e:null, f:null };
    }
}