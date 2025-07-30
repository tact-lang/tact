contract ValidExample {
    // persistent state variable initialized with a default value
    var1: Int = 0;

    // init() overrides the default value on deployment
    init() {
        self.var1 = 42;
    }
}
