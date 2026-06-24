struct OnlyDefaults {
    x: Int?;
    y: Bool = true;
    z: Int?;
}

contract DefaultsOptPersist {
    val: OnlyDefaults;

    init() {
        self.val = OnlyDefaults{
            y: false
        };
    }
}