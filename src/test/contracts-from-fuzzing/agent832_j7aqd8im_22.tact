contract OnlyOptionalInt {
    value: Int? = null;
    receive() {
        let _ = self.value;
    }
}