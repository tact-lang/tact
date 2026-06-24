struct D {
    a: Int?;
    b: Bool;
    c: String;
}

contract K {
    d: D;

    init() {
        self.d = D{
            a:null,
            b:true,
            c:"hi"
        };
    }
}