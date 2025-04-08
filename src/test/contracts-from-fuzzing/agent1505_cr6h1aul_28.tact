contract OptionalBoolInit {
    active: Bool?;
    init() {
        self.active = null;
    }
}