contract ManyPrimitives {
    flag1: Bool;
    flag2: Bool;
    counter: Int;
    name: String;
    extra: String;

    init() {
        self.flag1 = true;
        self.flag2 = false;
        self.counter = 5;
        self.name = "Alice";
        self.extra = "Data";
    }
}