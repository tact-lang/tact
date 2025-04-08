struct Reversed {
    b: Int;
    a: Int;
}

contract ReversedOrderFields {
    data: Reversed;

    init() {
        self.data = Reversed{a: 2, b: 1};
    }
}