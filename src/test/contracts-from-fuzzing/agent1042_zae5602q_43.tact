contract OptParam(
    val: Int?,
) {
    receive() {
        let _ = self.val;
    }
}