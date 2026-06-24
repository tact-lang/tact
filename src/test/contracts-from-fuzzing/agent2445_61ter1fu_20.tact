message(10) Hi {}

contract C {
    m: Hi;

    init() {
        self.m = Hi{};
    }

    receive() {}
}