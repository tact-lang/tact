contract TestHashData {
    receive() {
        // Using hashData on a valid string (8 characters, 8 bytes)
        let h: Int = "ABCDEFGH".hashData();
        h;
    }
}
