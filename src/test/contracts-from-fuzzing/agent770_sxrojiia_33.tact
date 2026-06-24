struct Leaf {
    num: Int;
}

struct Middle {
    leafOpt: Leaf?;
}

contract TestContract {
    value: Middle;

    init() {
        self.value = Middle{
            leafOpt: null
        };
    }
}