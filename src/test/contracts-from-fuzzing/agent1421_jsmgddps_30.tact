struct Inner {
    field: Int;
}

contract InitAssignPersistent {
    data: Inner;
    init() {
        self.data = Inner{field: 31};
    }
}