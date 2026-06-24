// optional Builder -- should not be supported as persistent var
contract OptionalBuilderFieldBug {
    b: Builder?;
    init() {
        self.b = null;
    }
}
