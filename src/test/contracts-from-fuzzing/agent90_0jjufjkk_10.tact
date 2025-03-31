contract Test8_mod {
    unusedValue: Int = 0;

    // Getter declared but never called within the contract
    get fun getUnused(): Int {
        return self.unusedValue;
    }

    receive() {}
}
