struct Inner {
    field: Int;
}

contract NestedTupleLike {
    i: Int = 7;
    s: String = "s";
    inn: Inner;

    init() {
        self.inn = Inner{field:1};
    }
}