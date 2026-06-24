struct Complex {
    a: Int;
    b: Bool?;
    c: String;
    d: String?;
}

contract OverwriteTest {
    var: Complex = Complex{a:0,b:null,c:"",d:null};

    init() {
        self.var = Complex{a:123, b:true, c:"abc", d:null};
    }
}