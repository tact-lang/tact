contract Test {
    // Contract-level constant: 1 Toncoin equals 1_000_000_000 nanoToncoin
    const TON_ONE: Int = ton("1");

    receive() {
        // Validate that TON_ONE equals 1_000_000_000
        require(self.TON_ONE == 1000000000, "ton conversion failed");
        dump(self.TON_ONE);
    }
}
