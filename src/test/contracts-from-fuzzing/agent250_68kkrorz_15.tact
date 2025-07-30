struct NestedLayer {
    flag: Bool;
}

contract LayeredOptionals {
    nested1: NestedLayer?;
    nested2: NestedLayer?;

    init() {
        self.nested1 = null;
        self.nested2 = NestedLayer{flag:true};
    }
}