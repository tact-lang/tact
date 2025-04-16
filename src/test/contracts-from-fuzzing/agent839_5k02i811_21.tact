struct SubS {
    field: String?;
}

struct SuperS {
    sub: SubS;
    opt: SubS?;
}

contract SuperNestedOptional {
    val: SuperS;
    init() {
        self.val = SuperS{ sub: SubS{field:null}, opt: null };
    }
}