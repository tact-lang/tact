// Chain of nested optional structs
struct InnerLevel {
    leaf: LeafStruct?;
}

struct LeafStruct {
    name: String;
    value: Int;
}

contract ChainOptionalStructs {
    root: InnerLevel?;

    init() {
        self.root = null;
    }
}
