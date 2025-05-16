contract TestNewAddressValid {
    fun test(): String {
        let addr: Address = newAddress(0, 42);
        return addr.toString();
    }
}
