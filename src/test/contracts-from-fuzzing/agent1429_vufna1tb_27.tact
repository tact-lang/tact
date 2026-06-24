struct DefaultStr {
    s: String = "default";
}

contract WithStringDefault {
    data: DefaultStr;

    init() {
        self.data = DefaultStr{ s: "changed" };
    }
}
