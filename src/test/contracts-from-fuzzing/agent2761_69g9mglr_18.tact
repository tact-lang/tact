struct X1 { p: Int?; q: Bool?; r: String?; }

struct Wrapper {
    w1: X1;
    w2: X1;
    w3: X1;
}

contract ManyOptionalStructFields {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            w1: X1{p:null,q:null,r:null},
            w2: X1{p:null,q:null,r:null},
            w3: X1{p:null,q:null,r:null}
        };
    }
}
