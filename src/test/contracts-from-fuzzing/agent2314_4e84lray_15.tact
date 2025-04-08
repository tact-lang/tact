struct SDefaultOpt {
    o: Int?;
}

contract TestOptImplicitNull {
    val: SDefaultOpt;
    init() {
        self.val = SDefaultOpt{};
    }
}