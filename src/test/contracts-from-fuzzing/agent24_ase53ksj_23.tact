contract TestAddressEdgeValidConst {
    fun test() : Bool {
        // Use an inline constant hex literal for the maximum valid hash value (256 bits),
        // expressed as 64 hex digits (all ones).
        let maxHash: Int = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
        let a: Address = newAddress(0, maxHash);
        return a.toString() != ""; // basic sanity check to ensure the address conversion worked
    }
}
