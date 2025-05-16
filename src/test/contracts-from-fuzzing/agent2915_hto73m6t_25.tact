struct ContainsUnicode {
    s: String = "Привет мир 👋🌍";
}

contract TestContract {
    cu: ContainsUnicode;

    init() {
        self.cu = ContainsUnicode{};
    }
}
