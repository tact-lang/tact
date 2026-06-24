trait SomeTrait {
    x: Int;
}

contract TraitInherit with SomeTrait {
    x: Int;

    init() {
        self.x = 55;
    }
}