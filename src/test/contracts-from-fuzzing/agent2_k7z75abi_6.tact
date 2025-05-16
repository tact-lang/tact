contract BoolAugAssign {
    flag: Bool = false;
    receive() {
        // Test augmented assignment for logical OR
        self.flag ||= true;
        if (self.flag) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
