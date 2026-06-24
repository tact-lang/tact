struct BigStrings {
    s1: String = "This is a reasonably long string default that might expose problems.";
    s2: String = "Another default long string, with emojis ✨🚀🔥💥 and unicode characters.";
}

contract TestContract {
    bs: BigStrings;

    init() {
        self.bs = BigStrings{};
    }
}