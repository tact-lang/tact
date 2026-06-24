struct MixDefault {
    a: Int = 1;
    b: Int? = null;
    c: Bool = true;
    d: Bool? = null;
    e: String = "hi";
    f: String? = null;
}

contract MixDefaultContract {
    storage: MixDefault;
    init() {
        self.storage = MixDefault{};
    }
}