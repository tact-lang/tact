struct OptionalManyDefaults {
    a:Int?; b:Int?; c:Int?;
    d:Int?; e:Int?; f:Int?;
}

contract OptManyDefaults {
    val: OptionalManyDefaults;

    init() {
        self.val = OptionalManyDefaults{};
    }
}
