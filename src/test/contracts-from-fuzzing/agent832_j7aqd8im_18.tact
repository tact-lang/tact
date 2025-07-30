contract OptionalStringField {
    note: String? = null;
    receive() {
        if (self.note != null) {
            let _ = self.note!!;
        }
    }
}