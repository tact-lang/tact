contract OptAssignReassign {
    v: Int?;
    init() {
        self.v = null;
        self.v = 10;
        self.v = null;
        self.v = 20;
    }
}