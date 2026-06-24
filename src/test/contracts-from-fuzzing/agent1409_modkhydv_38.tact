contract Test {
    s: String = "abc";
    sOpt: String? = null;
    receive() {
        if (self.sOpt != null) {
            let _ = self.sOpt!!;
        }
    }
}