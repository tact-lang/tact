contract TestGetterModification {
    x: Int;

    init() {
        self.x = 0;
    }

    // Getter trying to modify state variable (documented as disallowed)
    get fun modifyGetter(): Int {
        self.x = 42; // Intentional modification of state variable in getter
        return self.x;
    }
}

// A simple getter for comparison
contract TestGetterReadOnly {
    x: Int;

    init() {
        self.x = 0;
    }

    get fun readGetter(): Int {
        return self.x; // Read-only access, should be allowed
    }
}
