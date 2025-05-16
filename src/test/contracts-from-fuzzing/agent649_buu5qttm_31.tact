struct OptionalWithDefault {
    i: Int? = null;
}

contract OptDefaultField {
    x: OptionalWithDefault = OptionalWithDefault{};
    receive() {
        let _ = self.x.i;
    }
}