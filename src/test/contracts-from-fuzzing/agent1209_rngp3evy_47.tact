struct Sx {
    a: Int?;
    b: Bool?;
    c: String?;
}
contract OptTripleStruct {
    val: Sx;
    init() {
        self.val = Sx{a:null,b:null,c:null};
    }
}