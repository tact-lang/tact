struct Inner {
    a: Int; b: Bool; s: String; opt: Int?;
}

contract Test {
    val: Inner;

    init() {
        self.val = Inner{ a:1, b:true, s:"ok", opt:null };
    }
}