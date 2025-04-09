struct Sinner {
    x: Int;
    y: Bool;
    z: String;
}

contract NullableStructField {
    val: Sinner?;

    init() {
        self.val = null;
    }
}