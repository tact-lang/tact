struct DeepChainOptionals {
    node: NodeOpt?;
}

struct NodeOpt {
    optVal: Int?;
    next: LeafOpt?;
}

struct LeafOpt {
    flag: Bool?;
    text: String?;
}

contract DeepOptionalsExample {
    data: DeepChainOptionals;

    init() {
        self.data = DeepChainOptionals{node: null};
    }
}