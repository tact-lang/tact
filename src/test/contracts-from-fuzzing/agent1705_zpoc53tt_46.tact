message First {}
message Second {}

contract MultipleEmptyMessages {
    m1: First;
    m2: Second;

    init() {
        self.m1 = First{};
        self.m2 = Second{};
    }
}