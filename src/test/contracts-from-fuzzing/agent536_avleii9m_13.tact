struct Bag {
    addr: Address?;
    data: Cell?;
}

contract ComplexOpt {
    content: Bag = Bag{addr: null, data: null};

    init() {
        self.content = Bag{addr: null, data: null};
    }
}