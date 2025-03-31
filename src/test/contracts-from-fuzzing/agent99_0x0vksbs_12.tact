contract TestContract {
    receive() {
        // Testing valid Base64 decoding from a string
        let s: String = "SGVyZSdzIEpvaG5ueSE=";
        let sl: Slice = s.fromBase64();
        // Convert the resulting slice back to string and dump it; note: result might include non-printable characters
        dump(sl.asString());
    }
}
