struct Item {
    price: Int?;
    name: String?;
}

struct Order {
    id: Int;
    buyer: String?;    // optional, no default
    item: Item? = null; // optional with implicit default null
}

contract TestContract {
    order: Order;

    init() {
        self.order = Order{
            id: 1,
            buyer: "Bob",
            item: Item{ price: 100, name: "Book" }
        };
    }
}