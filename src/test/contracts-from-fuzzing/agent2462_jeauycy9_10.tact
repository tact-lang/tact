struct Complex {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    s: String;
    t: String;
}

contract TestContract {
    val1: Complex;
    val2: Complex;

    init() {
        self.val1 = Complex{a:1,b:true,c:null,d:false,s:"s1",t:"t1"};
        self.val2 = Complex{a:2,b:false,c:3,d:null,s:"s2",t:"t2"};
    }
}