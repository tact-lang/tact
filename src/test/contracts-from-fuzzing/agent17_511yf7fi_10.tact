contract TestMapAddress {
    receive() {
        let a: Address = context().sender;
        let m: map<Address, Int> = emptyMap();
        m.set(a, 999);
        let v: Int? = m.get(a);
    }
}
