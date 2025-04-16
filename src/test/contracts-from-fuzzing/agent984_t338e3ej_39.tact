struct HasOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptInner {
    d: HasOptional = HasOptional{a:null,b:null,c:null};
}