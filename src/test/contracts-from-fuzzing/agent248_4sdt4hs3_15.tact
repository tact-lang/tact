struct Complex {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
}

contract TestContract {
    data: Complex;
    init() {
        self.data = Complex{
            i:1, b:true, s:"s", a:myAddress(),
            opt1:null, opt2:true, opt3:null, opt4:null
        };
    }
}