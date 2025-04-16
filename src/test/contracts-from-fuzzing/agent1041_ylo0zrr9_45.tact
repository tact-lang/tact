message(1) Leaf {}

struct Level2 {
    leaf: Leaf;
}

struct Level1 {
    nested: Level2;
}

contract WrappedEmptyMsg {
    content: Level1;

    init() {
        self.content = Level1{
            nested: Level2{
                leaf: Leaf{}
            }
        };
    }
}
