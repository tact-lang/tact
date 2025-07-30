struct LargeCombo {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Int;
    h: String;
    i: Bool;
    j: Int?;
    k: String?;
    l: Bool?;
}

contract LargeComboContract {
    val: LargeCombo;

    init() {
        self.val = LargeCombo{
            a:1, b:"b", c:true, d:null, e:null, f:false,
            g:2, h:"h", i:true, j:10, k:null, l:true
        };
    }
}