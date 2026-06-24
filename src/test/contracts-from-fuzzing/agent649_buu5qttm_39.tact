contract OptionalUninit {
    x: Int?;
    receive() {
        let _ = self.x;
    }
}