struct Complex {
    i: Int;
    b: Bool;
    s: String;
    o: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
    message: String?;
}

contract ComplexNested {
    data: Complex;

    init() {
        self.data = Complex{
            i:5, b:true, s:"hi",
            o: InnerOpt{flag:false,message:null}
        };
    }
}
