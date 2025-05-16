struct InnerOpt {
    foo: Int?;
}

struct OuterS {
    inner: InnerOpt;
}

contract NestedOptNoInit {
    data: OuterS;
    init() {
        self.data = OuterS{ inner: InnerOpt{} };
    }
}