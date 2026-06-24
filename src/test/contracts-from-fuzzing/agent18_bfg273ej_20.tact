contract TestMapCell {
    receive() {
        // Testing map with Int keys and Cell values
        let m: map<Int, Cell> = emptyMap();
        // Store a cell that encodes the integer 123 using 32 bits
        m.set(1, beginCell().storeUint(123, 32).endCell());
        let c: Cell? = m.get(1);
        if (c != null) {
            let s: Slice = c!!.beginParse();
            let num: Int = s.loadUint(32);
            dump(num); // Expected output: 123
        } else {
            dump(-1);
        }
    }
}
