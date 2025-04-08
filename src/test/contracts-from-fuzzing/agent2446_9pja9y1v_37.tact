trait T {
    a: Int;
}

contract TraitWithNested with T {
    a: Int;
    nested: StructInContract;

    init() {
        self.a = 1;
        self.nested = StructInContract{ x:2, b:true };
    }
}

struct StructInContract {
    x: Int;
    b: Bool;
}