struct EndNode { f: Int; }
struct MidNode { left: EndNode; right: EndNode; }
struct RootNode { m: MidNode; extra: Int?; }

contract SemiDeep {
    storage: RootNode;

    init() {
        self.storage = RootNode{
            m: MidNode{
                left: EndNode{ f:1 },
                right: EndNode{ f:2 }
            },
            extra: null
        };
    }
}
