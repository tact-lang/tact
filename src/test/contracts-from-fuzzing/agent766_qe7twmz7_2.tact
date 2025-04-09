struct Inner {
    x: Int = 1;
    y: Bool = true;
    z: String = "ok";
    optA: Int?; // defaults to null implicitly
}

contract WithStructField {
    data: Inner = Inner{};
    init() {
        self.data = Inner{x: 5, y: false, z: "zzz", optA: 42};
    }
}