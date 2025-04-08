struct InnerOpt {
    val: Int = 3;
}

struct OuterOpt {
    nested: InnerOpt?; 
}

contract NestedOptionals {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ nested: null };
    }
}
