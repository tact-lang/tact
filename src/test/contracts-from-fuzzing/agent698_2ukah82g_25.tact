struct Complex {
    a: Int as uint64;
    b: Bool;
    c: Int?;
    d: String;
    e: Bool?;
}

contract TestContract {
    val1: Complex;
    val2: Complex;

    init() {
        self.val1 = Complex{ a:100, b:true, c:null, d:"hi", e: false };
        self.val2 = Complex{ a:200, b:false, c:50, d:"bye", e: null };
    }
}