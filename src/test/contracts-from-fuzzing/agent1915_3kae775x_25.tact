contract FieldReassign {
    data: Int;

    init() {
        self.data = 1;
        self.data = 2;
        self.data = 3;
    }
}