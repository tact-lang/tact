contract TestContract {
    s1: String?; // optional, default null
    s2: String? = null; // explicit default null
    s3: String = "abc";
    s4: String; // no default

    init() {
        self.s4 = "def";
    }
}