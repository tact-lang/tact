struct Item {
    flag: Bool? = null;
    data: String = "ok";
}

contract TestContract {
    item: Item;

    init() {
        self.item = Item{
            flag: true,
            data: "hello"
        };
    }
}