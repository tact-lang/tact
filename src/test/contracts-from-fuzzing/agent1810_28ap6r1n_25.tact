struct InnerWrapped {
    i: Int;
}

struct OuterWrapped {
    wrap: InnerWrapped;
}

contract WrappedLayer {
    field: OuterWrapped;
    init() {
        self.field = OuterWrapped{ wrap: InnerWrapped{i:5} };
    }
}