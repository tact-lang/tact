contract TestMapAddress() {
    fun test() {
        let m: map<Address, Int> = emptyMap();
        let addr: Address = myAddress();
        m.set(addr, 123);
        let value: Int = m.get(addr)!!;
        dump(value); // expected output: 123
    }

    receive() {
        self.test();
    }
}
