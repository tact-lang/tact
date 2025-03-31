contract TestStringLoadUint {
    receive() {
        let s: String = "A";
        // Convert the string to a slice and read the first 8 bits as an integer (should be ASCII code 65)
        let c: Int = s.asSlice().loadUint(8);
        c;
    }
}
