// Mixed explicit and implicit optionals and defaults
struct Mix {
    x: Int?;
    y: Bool = true;
    z: String? = null;
}

contract MixedOptionals {
    val: Mix;

    init() {
        self.val = Mix{
            x: null, z: null
        };
    }
}
