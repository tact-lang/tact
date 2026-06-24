struct S {
    a: Int?;
    b: Bool;
}

contract OptFirst {
    val: S;

    init() {
        self.val = S{ a:null, b:true };
    }
}
