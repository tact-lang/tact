contract NullableAndDefaults {
    a: Int?;            // null default
    b: Bool?;           // null default
    c: String?;         // null default
    d: Int = 5;         // explicit default
    e: Bool = true;     // explicit default
    f: String = "hi";  // explicit default

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = 5;
        self.e = true;
        self.f = "hi";
    }
}