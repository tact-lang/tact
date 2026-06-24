contract TestFromBase64 {
    receive() {
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let sl: Slice = s.fromBase64();
        dump(sl);
    }
}
