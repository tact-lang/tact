struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract MultipleOptionalStruct {
    many: ManyOptionals;

    init() {
        self.many = ManyOptionals{ a:null, b:null, c:null, d:null, e:null };
    }
}