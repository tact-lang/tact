// struct with trailing defaulted fields followed by required
struct StrangeOrder {
    a: Int = 1;
    b: Int = 2;
    c: Int;
}

contract TestContract {
    s: StrangeOrder;

    init() {
        self.s = StrangeOrder{
            c: 42
        };
    }
}