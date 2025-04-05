contract TestBoolAugAssignment {
    receive() {
        // Testing augmented assignment operators for Bool: logical OR assignment
        let b: Bool = true;
        b ||= false;
        dump(b);
    }
}
