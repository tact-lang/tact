contract TestAddressBool {
    // Map with key type Address and value type Bool
    m: map<Address, Bool> = emptyMap();

    receive() {
        // Get sender address from context and use it as key
        let addr: Address = context().sender;
        self.m.set(addr, true);
        let flag: Bool = self.m.get(addr)!!;
        dump(flag); // expected output: true (1)
    }
}
