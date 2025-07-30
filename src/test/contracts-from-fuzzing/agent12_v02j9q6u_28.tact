contract TestMapCell {
    m: map<Int, Cell> = emptyMap();

    receive() {
        // Create a cell that stores a 16-bit unsigned integer 999
        let cellVal: Cell = beginCell().storeUint(999, 16).endCell();

        // Insert it into the map
        self.m.set(1, cellVal);

        // Retrieve the stored cell
        let retrieved: Cell? = self.m.get(1);
        if (retrieved != null) {
            let s: Slice = retrieved!!.beginParse();
            dump(s.loadUint(16)); // Expected output: 999
        } else {
            dump(0);
        }
    }
}
