contract Test {
    wasBounceable: Bool? = null;

    receive() {}

    receive("test") {
        let ctx = context();
        self.wasBounceable = ctx.bounceable;
    }

    get fun wasBounceable(): Bool {
        return self.wasBounceable!!;
    }
}
