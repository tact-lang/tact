contract TestParseStdAddressExtraData {
    fun test() : Bool {
         let addr: Address = newAddress(0, 42);
         // Append extra 8 bits (value 15) to the standard address slice
         let sliceWithExtra = beginCell().storeAddress(addr).storeUint(15, 8).asSlice();
         let stdAddr = parseStdAddress(sliceWithExtra);
         return stdAddr.workchain == 0 && stdAddr.address == 42;
    }
}
