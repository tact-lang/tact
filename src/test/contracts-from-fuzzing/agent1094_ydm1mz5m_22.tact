struct X {
    a: Int;
    b: Bool;
    c: String?
}

contract OptDefault {
    data: X;
    init() {
        self.data = X{a:5,b:true,c:null};
    }
}