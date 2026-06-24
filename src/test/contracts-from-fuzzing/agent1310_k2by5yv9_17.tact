struct Item { x: Int?; }

struct Wrapper { item: Item?; }

contract TestContract {
    w: Wrapper?;

    init() {
        self.w = null;
    }
}
