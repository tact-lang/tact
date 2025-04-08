struct DefaultsEmbed {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
}

contract DefaultStructField {
    val: DefaultsEmbed;

    init() {
        self.val = DefaultsEmbed{};
    }
}
