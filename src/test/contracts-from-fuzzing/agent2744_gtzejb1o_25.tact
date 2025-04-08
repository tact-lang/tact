struct Id {
    id: Int;
}

contract DirectStructInline {
    field: Id;

    init() {
        self.field = Id{ id: 5 };
    }
}
