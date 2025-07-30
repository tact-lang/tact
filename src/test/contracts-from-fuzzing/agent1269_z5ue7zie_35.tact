// optional int with default zero
struct OptIntZero {
    x: Int? = 0;
}

contract TestContract {
    o: OptIntZero;
    init() {
        self.o = OptIntZero{};
    }
}