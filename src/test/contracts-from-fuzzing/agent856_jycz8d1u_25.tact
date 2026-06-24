contract OrderedPersistent {
    first: Int = 1;
    second: Bool = false;
    third: String = "ok";

    init() {
        self.first = 42;
        self.second = true;
        self.third = "done";
    }
}