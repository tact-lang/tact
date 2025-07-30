contract MixedDefaultInit {
    a: Int = 5;
    b: Bool;
    c: String = "ok";
    d: Slice;

    init() {
        self.b = false;
        self.d = emptyCell().asSlice();
    }
}