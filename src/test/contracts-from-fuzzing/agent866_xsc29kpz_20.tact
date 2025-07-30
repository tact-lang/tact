struct SOpt {
    x: Int?;
}

contract UninitOptional {
    data: SOpt;
    init() {
        self.data = SOpt{};
    }
}