contract ComplexAddressLogic {
    // Persistent state variable for Address
    addr: Address;

    // Constructor: initialize with a specific address
    init() {
        self.addr = newAddress(0, 0x123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0);
    }

    // Receiver function: on receiving message "Update", conditionally update the persistent address
    receive("Update") {
        // Use the address's string representation in a conditional, then update accordingly
        if (self.addr.toString() != "") {
            // Self assignment (no change) for testing side effects
            self.addr = self.addr;
        } else {
            self.addr = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
        }
    }

    // Getter function: Compares the stored address with one obtained via chained conversions
    // Address -> Slice -> Address
    get fun compareConversions(): Bool {
        let slice1: Slice = self.addr.asSlice();
        let addr2: Address = slice1.asAddressUnsafe();
        return self.addr == addr2;
    }

    // Getter function: Uses a conditional (ternary) operator for addresses
    get fun conditionalAddress(): Address {
        return self.addr.toString() != "" ? self.addr : newAddress(0, 0);
    }

    // Getter function: Returns a boolean based on nested operations on the persistent address
    get fun nestedLogicTest(): Bool {
        // Combine conditional operator and conversion functions
        let addrAlt: Address = self.addr.toString() != "" ? self.addr : self.addr.asSlice().asAddressUnsafe();
        return self.addr == addrAlt;
    }
}
