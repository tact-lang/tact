contract TestContract {
    optVal: Int?;
    receive() {
        let _ = self.optVal;
    }
}