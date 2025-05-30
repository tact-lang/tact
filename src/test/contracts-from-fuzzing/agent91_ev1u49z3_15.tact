contract TestFromBase64 {
    receive() {
        // Testing String.fromBase64 function
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let sl: Slice = s.fromBase64();
        let _ = sl;
    }
}
