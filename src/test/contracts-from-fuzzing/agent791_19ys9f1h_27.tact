struct Def {
    a: Int = 1;
    b: Bool = false;
    c: Int = 3;
}

contract TestContract {
    def: Def = Def{ b: true };
}
