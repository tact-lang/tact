struct LargeStrings {
    s1: String;
    s2: String;
}

contract StringStress {
    data: LargeStrings;

    init() {
        self.data = LargeStrings {
            s1: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            s2: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        };
    }
}