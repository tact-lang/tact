struct SomeS {
    a: Int?;
    b: Int = 1;
}

contract PartialStructInit {
    s: SomeS;

    init() {
        self.s = SomeS{};
    }
}
