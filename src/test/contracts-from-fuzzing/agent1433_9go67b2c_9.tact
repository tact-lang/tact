contract DefaultAndInit {
    foo: Int = 0;
    bar: String;

    init() {
        self.bar = "hello";
    }
}
