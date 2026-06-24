struct F {
    text: String? = null;
    flag: Bool? = null;
    n: Int? = null;
}

contract DefaultsOptNested {
    data: F;

    init() {
        self.data = F{};
    }
}