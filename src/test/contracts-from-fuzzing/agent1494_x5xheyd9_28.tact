struct IntHolder {
    a: Int;
}

contract MultipleAssignments {
    field: IntHolder;

    init() {
        self.field = IntHolder{a: 0};
        self.field = IntHolder{a: 42};
    }
}
