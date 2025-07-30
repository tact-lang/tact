struct NestedDefaultsOpts {
    a: Int?;
    b: Int = 2;
    c: Bool;
    d: String = "hello";
}

contract InitDefaultOpt {
    data: NestedDefaultsOpts;

    init() {
        self.data = NestedDefaultsOpts{ a:null, c:true };
    }
}