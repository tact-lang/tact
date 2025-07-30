contract InlineInitVars {
    counter: Int = 0;
    status: Bool = true;
    message: String = "init";
    optionalText: String? = null;

    init() {
        self.counter = 10;
        self.status = false;
        self.message = "changed";
        self.optionalText = "hello";
    }
}