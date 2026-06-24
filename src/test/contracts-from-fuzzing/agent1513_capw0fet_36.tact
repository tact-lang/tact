struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract BigOpt {
    f: NestedOptionals;

    init() {
        self.f = NestedOptionals{ a:null,b:true,c:null };
    }
}