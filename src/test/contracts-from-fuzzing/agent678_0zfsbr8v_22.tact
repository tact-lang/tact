struct Sub {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalNested {
    sub: Sub?;

    init() {
        self.sub = Sub{a:null,b:null,c:null};
    }
}