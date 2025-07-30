contract OptionalBoolTest {
    ready: Bool?;
    active: Bool?;

    init() {
        self.ready = null;
        self.active = true;
    }
}
