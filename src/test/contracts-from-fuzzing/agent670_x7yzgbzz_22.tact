struct Top {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

contract Shadowing {
    data: Top;
    data2: Top;

    init() {
        self.data = Top{ a: 1, b:false, c:null, d:true };
        self.data2 = Top{ a:2, b:true, c:null, d:false };
    }
}