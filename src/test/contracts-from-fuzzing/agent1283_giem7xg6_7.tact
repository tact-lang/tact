struct Small {
    val: Int;
}

contract OptionalStructField {
    data: Small?;

    init() {
        self.data = null;
    }
}