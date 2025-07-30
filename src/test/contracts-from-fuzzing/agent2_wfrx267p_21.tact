contract Test {
    receive() {
        // Test using fromBase64 and asSlice.fromBase64 on a valid Base64-encoded string
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let sliceA: Slice = s.fromBase64();
        let sliceB: Slice = s.asSlice().fromBase64();
        
        // Ensure both slices are equal; if not, perform a dummy computation
        if (sliceA != sliceB) {
            let dummy: Int = sliceA.hashData() + sliceB.hashData();
        }
    }
}
