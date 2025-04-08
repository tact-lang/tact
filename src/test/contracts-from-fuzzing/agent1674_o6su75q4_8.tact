contract OptionalPrimitives {
    age: Int?;
    name: String?;
    flag: Bool?;

    init() {
        self.age = 25;
        self.name = null;
        self.flag = true;
    }
}