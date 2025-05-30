trait SomeTrait {
    trInt: Int;
}

contract InheritsTrait with SomeTrait {
    trInt: Int;

    init() {
        self.trInt = 42;
    }
}