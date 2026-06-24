// struct with dense optionals at multiple depths
struct LeafOpt {
    x: Int?;
    y: Bool?;
}

struct NestedOpt2 {
    leaf: LeafOpt?;
    comment: String?;
}

contract DenseOptionPointers {
    data: NestedOpt2?;
    init() {
        self.data = null;
    }
}