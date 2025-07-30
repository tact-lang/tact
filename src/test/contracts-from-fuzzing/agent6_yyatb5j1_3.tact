struct DeepNested {
    flag: Bool = true;
    inner1: Int?;
    inner2: String?;
    inner3: Address?;
    inner4: Cell?;
}

contract TestContract {
    nest: DeepNested;

    init() {
        self.nest = DeepNested{};
    }
}