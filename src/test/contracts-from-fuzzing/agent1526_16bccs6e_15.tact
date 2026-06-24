struct MixDefaults {
    a: Int = 5;
    b: Bool;
    c: String = "hi";
    d: Bool?;
}

contract DefaultsAndOptional {
    val: MixDefaults;

    init() {
        self.val = MixDefaults{ b: false };
    }
}