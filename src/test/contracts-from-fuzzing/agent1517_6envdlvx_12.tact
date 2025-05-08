struct Details { desc: String; }
struct Item { id: Int; meta: Details?; }

contract NestedOptionalStructField {
    stored: Item;
    init() {
        self.stored = Item{
            id: 42,
            meta: null
        };
    }
}