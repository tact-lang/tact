struct Complex {
    a: Int;
    b: Bool;
    c: String?;
    d: Slice;
}

contract TestContract {
    data1: Complex;
    data2: Complex;
    init() {
        self.data1 = Complex{a:1,b:false,c:"foo",d:emptyCell().asSlice()};
        self.data2 = Complex{a:2,b:true,c:null,d:emptyCell().asSlice()};
    }
}