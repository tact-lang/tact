contract Test(
    a: Int?,
    b: Bool?
) {
    receive() {
        if (self.a != null) {
            let _ = self.a!!;
        }
    }
}