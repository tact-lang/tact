struct X {
    s: String?;
    i: Int?;
    c: Cell?;
    sl: Slice?;
    a: Address?;
    b: Bool?;
}

contract MixedOptionals {
    data: X;
    init(){
        self.data = X{s:null,i:null,c:null,sl:null,a:null,b:null};
    }
}