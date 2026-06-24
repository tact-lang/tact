trait MyTrait {
    value: Int;
}

contract TraitInheritTest with MyTrait {
    value: Int;
    init() {
        self.value = 42;
    }
}