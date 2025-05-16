contract NegativeUintAssignment {
    val: Int as uint16;

    init() {
        self.val = -1;  // should be out of range during finalization, accepted at assign
    }
}