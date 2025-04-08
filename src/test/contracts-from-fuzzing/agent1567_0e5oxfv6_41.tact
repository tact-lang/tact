struct MixedDefaults2 {
    a: Int = 42;
    b: Bool = false;
    c: String = "abc";
    d: Address? = null;
    e: Bool? = null;
    f: Int? = null;
}

contract MixedDefaultContract {
    val: MixedDefaults2;

    init() {
        self.val = MixedDefaults2{};
    }
}