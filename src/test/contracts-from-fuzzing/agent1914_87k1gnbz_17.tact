struct OptionalDeep {
    a: Second?;
}

struct Second {
    b: Third?;
}

struct Third {
    c: Int?;
}

contract TestContract {
    val: OptionalDeep;

    init() {
        self.val = OptionalDeep{ a: Second{ b: Third{ c:null } } };
    }
}