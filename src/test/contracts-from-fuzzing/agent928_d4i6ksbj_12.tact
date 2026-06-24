struct SOpt {
    val: Int?;
}

contract NestedOptionals {
    f1: SOpt?;
    f2: SOpt?;

    init() {
        self.f1 = null;
        self.f2 = SOpt{val: null};
    }
}