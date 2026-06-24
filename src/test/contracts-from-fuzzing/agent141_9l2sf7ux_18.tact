contract LongStringDefaults {
    a: String = "lorem ipsum dolor sit amet consectetur adipiscing elit";

    init() {
        self.a = "shorter";
    }
}