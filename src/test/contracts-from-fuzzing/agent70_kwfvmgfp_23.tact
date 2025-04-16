struct Info {
    n: Int;
}

contract TestContract(
    optInfo: Info?,
) {
    receive() {
        if (self.optInfo != null) {
            let _ = self.optInfo!!.n;
        }
    }
}