struct Complex {
    i: Int;
    b: Bool?;
    s: String;
    optS: String?;
    addr: Address?;
    cel: Cell?;
    slc: Slice?;
    flag: Bool;
}

contract ManyFieldTypes {
    data: Complex;

    init() {
        self.data = Complex{
            i: 6, b: null, s:"hi", optS:null, addr:null,
            cel:null, slc:null, flag:true
        };
    }
}