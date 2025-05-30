struct S {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptNulls {
    val: S;

    init() {
        self.val = S{a:null,b:null,c:null};
    }
}