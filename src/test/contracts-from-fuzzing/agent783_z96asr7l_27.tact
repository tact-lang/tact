contract OptionalBoolInit {
    a: Bool?;
    b: Bool?;

    init() {
        self.a = true;
        self.b = null;
    }
}