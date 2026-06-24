struct SOptPrim {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract SingleOptStructStorage {
    field: SOptPrim;

    init() {
        self.field = SOptPrim{a:null, b:true, c:null};
    }
}