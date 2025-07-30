struct Complex {
    i1: Int;
    b1: Bool;
    s1: String;
    o1: Int?;
    o2: String?;
    inr: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
    o: String?;
}

contract Test {
    val: Complex;

    init() {
        self.val = Complex{
            i1:1,
            b1:true,
            s1:"a",
            o1:null,
            o2:"x",
            inr: Inner{a:5, b:false, o:null}
        };
    }
}