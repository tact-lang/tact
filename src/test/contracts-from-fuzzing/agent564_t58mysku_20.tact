// Contract with empty optional struct field and then assigned in receive
struct Item {
    count: Int;
    label: String;
}

contract NullStructSet {
    f: Item?;
    init() {
        self.f = null;
    }
    receive() {
        if (self.f == null) {
            self.f = Item { count: 5, label: "foo" };
        }
    }
}