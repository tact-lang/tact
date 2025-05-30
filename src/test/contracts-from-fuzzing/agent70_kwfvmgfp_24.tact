contract TestContract(
    maybeInt: Int?,
) {
    receive() {
        if (self.maybeInt != null) {
            let _ = self.maybeInt!! + 1;
        }
    }
}