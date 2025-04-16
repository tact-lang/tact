contract OptionalDeepNest {
    val1: Int? = null;
    val2: Bool? = true;
    val3: String? = null;
    val4: Int? = 123;
    val5: Bool? = null;

    receive() {
        let _ = self.val4;
    }
}