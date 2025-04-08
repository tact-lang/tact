struct DefaultedNested {
    x: Int = 5;
    y: Int = 7;
}

contract DefaultedNestedContract {
    val: DefaultedNested;
    init() {
        self.val = DefaultedNested{};
    }
}