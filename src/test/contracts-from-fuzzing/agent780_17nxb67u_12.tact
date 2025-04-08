struct InnerS {
    a: Int;
    b: String?;
}

struct OuterS {
    s: InnerS?;
}

contract NestedOptionals {
    data: OuterS;

    init() {
        self.data = OuterS{ s: null };
    }
}