struct ManyStrings {
    s1: String = "Hello";
    s2: String = "";
    s3: String = "Lorem ipsum dolor sit amet consectetur adipiscing elit";
}

contract TestContract {
    ms: ManyStrings = ManyStrings{};

    init() {}

    receive() {
        dump(self.ms.s1);
        dump(self.ms.s2);
        dump(self.ms.s3);
    }
}