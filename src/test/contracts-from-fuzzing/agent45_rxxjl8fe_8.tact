contract TestAddress {
    // Using a valid address compile-time – should compile successfully as documented in the Core Comptime docs 
    addr: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");

    fun main(): Address {
        return self.addr;
    }
}
