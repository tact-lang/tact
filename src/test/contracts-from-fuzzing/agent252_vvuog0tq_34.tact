contract OnlyFields {
    x: Int = 1;
    y: Bool = false;
    z: String = "hello";

    receive() {
        // access fields
        let _ = self.x + 1;
    }
}