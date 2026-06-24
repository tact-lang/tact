struct Def {
    a: Int = 1;
    b: Bool = true;
    c: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
}

contract TestContract {
    def: Def = Def{};
}
