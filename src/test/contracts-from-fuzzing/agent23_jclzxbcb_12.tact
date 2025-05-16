contract OptionalAddressTest {
    // Optional persistent state variable for an Address
    addr: Address?;

    // Initialize the contract with addr set to null
    init() {
        self.addr = null;
    }

    // Receiver function: on receiving message "Set", update the address
    receive("Set") {
        // Set the address to a specific value
        self.addr = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    }

    // Getter function: returns the stored address (unwraps using non-null assertion)
    get fun getAddr(): Address {
        return self.addr!!;
    }

    // Getter function: converts stored address to Slice and returns it
    get fun getAddrAsSlice(): Slice {
        return self.addr!!.asSlice();
    }

    // Getter function: returns the string representation of the stored address
    get fun getAddrAsString(): String {
        return self.addr!!.toString();
    }
}

// Additional contract: Testing interaction between contract parameters and address conversions
contract ParameterizedAddressTest(paramAddr: Address) {
    // In parameterized contracts, parameters are accessible via the 'self' prefix
    get fun getParamAddr(): Address {
        return self.paramAddr;
    }

    get fun getParamAddrAsString(): String {
        return self.paramAddr.toString();
    }
}
