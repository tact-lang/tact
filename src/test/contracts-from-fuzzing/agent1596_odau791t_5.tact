contract OptionalPrimitiveFields {
    x: Int? = null;
    y: Bool? = true;
    z: String? = null;

    receive() {
        let _ = self.y;
    }
}