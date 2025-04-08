contract WithConstants {
    const X: Int = 10;
    const Y: String = "hi";
    val: Int;
    text: String;

    init() {
        self.val = self.X;
        self.text = self.Y;
    }
}