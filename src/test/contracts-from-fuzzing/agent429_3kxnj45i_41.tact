trait MyTrait {
    a: Int;
}

contract TraitInherit with MyTrait {
    a: Int;
    init() {
        self.a = 42;
    }
}
