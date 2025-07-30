struct Bag {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    bag: Bag;

    init() {
        self.bag = Bag{ x: 5, y: true, z: "ok" };
    }
}