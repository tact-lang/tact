// persist nested optionals inside non-optional struct

struct Child {
    val: Int?;
}

struct Holder {
    child1: Child?;
    child2: Child?;
}

contract TestContract {
    data: Holder;

    init() {
        self.data = Holder {
            child1: null,
            child2: Child { val: null }
        };
    }
}