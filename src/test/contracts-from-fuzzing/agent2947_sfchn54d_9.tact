struct Inner { flag: Bool; }

contract OptionalStructField {
    val: Inner?;

    init() {
        self.val = null;
    }
}