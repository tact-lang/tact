contract Test {
    receive() {
        let sender: Address = context().sender;
        let m: map<Address, Bool> = emptyMap();
        m.set(sender, true);
        let val: Bool? = m.get(sender);
        if (val != null) {
            if (val == true) { dump(1); } else { dump(0); }
        } else {
            dump(0);
        }
    }
}
