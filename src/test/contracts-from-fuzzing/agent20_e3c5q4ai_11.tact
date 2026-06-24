contract BounceTryCatch2 {
    field: Int;

    init() {
        self.field = 42;
    }

    bounced(raw: Slice) {
        // divisor equals state field minus 42, which is set to 42 during init, so it's 0 at runtime
        let divisor: Int = self.field - 42;
        try {
            let y: Int = 1 / divisor; // division by zero at runtime should throw
            self.field = y;
        } catch (err) {
            self.field = err; // capture the error exit code
        }
        self.reply(self.field.toString().asComment());
    }
}
