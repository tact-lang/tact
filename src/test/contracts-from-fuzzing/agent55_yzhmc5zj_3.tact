struct DefaultAndOptional {
    val1: Int = 1;
    val2: Int?;
    val3: Bool = true;
    val4: String?;
}

contract TestDefaults {
    conf: DefaultAndOptional;
    init() {
        self.conf = DefaultAndOptional{
            val2: null,
            val4: null
        };
    }
}