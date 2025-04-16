struct Nest {
    deep: Int?;
}

contract ChangeOptionalField {
    n: Nest;

    init() {
        self.n = Nest{deep: null};
        self.n.deep = 5;
    }
}