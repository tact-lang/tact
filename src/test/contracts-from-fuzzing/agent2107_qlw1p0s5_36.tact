struct EmptyDefaults {
    a: Int?;
    b: String?;
}

contract EmptyInit {
    val: EmptyDefaults;

    init() {
        self.val = EmptyDefaults{
            a: null,
            b: null,
        };
    }
}