struct OnlyOptional {
    foo: Int?;
}

contract MissingInit {
    val: OnlyOptional;
    init() {
        self.val = OnlyOptional{}; // omit foo, should default null
    }
}