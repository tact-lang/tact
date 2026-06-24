struct Defs {
    v1: Int = 10;
    v2: Bool = true;
    v3: String = "ok";
}

contract PartialDefaults {
    val: Defs;

    init() {
        self.val = Defs{ v2: false };
    }
}