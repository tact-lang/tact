struct Bag {
    x: Int? = 5;
    y: Bool? = true;
    s: String? = "text";
}

contract Test {
    bag: Bag;

    init() {
        self.bag = Bag{}; // rely on defaults
    }
}