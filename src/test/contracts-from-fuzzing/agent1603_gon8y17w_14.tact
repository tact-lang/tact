struct OptionalTree {
    left: Int?;
    right: Int?;
}

contract OptionalTreeContract {
    tree: OptionalTree;

    init() {
        self.tree = OptionalTree{
            left: 1,
            right: null
        };
    }
}