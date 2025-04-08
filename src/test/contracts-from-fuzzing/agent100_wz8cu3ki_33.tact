struct Dual {
    a: Int;
    b: Bool?;
}

contract Test34 {
    val: Dual;

    init() {
        self.val = Dual{ a:77, b:null };
    }
}