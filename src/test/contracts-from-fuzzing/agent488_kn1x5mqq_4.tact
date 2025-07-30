struct Bag {
    one: Int;
    two: Int?;
    three: Bool = false;
}

contract TestContract {
    data: Bag;

    init() {
        self.data = Bag{
            one: 42,
            two: null
        };
    }
}