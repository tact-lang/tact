contract TestMapAddress {
    receive() {
        let sender: Address = context().sender;
        let m: map<Address, Bool> = emptyMap();
        m.set(sender, true);
        let flag: Bool = m.get(sender)!!;
        dump(flag); // expected: true
    }
}
