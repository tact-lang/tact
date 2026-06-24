struct Sub {
    x: Int = 5;
    y: Bool? = null;
    z: String = "hello";
}

contract OptionalStructField {
    s: Sub?;  

    init() {
        self.s = null;
    }
}
