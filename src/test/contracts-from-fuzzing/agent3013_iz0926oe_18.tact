struct S {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract ManyNulls {
    data: S;

    init() {
        self.data = S{a:null,b:null,c:null};
    }
}
