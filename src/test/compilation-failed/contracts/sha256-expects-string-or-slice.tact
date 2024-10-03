contract Sha256 {
    val: Int = 0;
    receive() {
        sha256(self.val);
    }
}
