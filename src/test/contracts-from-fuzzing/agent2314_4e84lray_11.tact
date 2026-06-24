struct SOpt {
    opt: Int?;
}

contract TestOptionalFieldDefault {
    data: SOpt;

    init() {
        self.data = SOpt{};
    }
}