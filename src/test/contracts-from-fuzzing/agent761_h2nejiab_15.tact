struct Complex {
    a: Int;
    b: Bool;
    s: String;
    o: Int?;
    n: Address?;
}

contract MultiTypeFields {
    data: Complex;

    init() {
        self.data = Complex{
            a:42,b:true,s:"hi",o:null,n:null
        };
    }
}
