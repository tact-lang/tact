struct InnerInit {
    foo: Int;
}

contract InitInner {
    field: InnerInit;
    init() {
        self.field = InnerInit{foo:42};
    }
}