struct NestedOptionals {
    o1: Int?;
    o2: Bool?;
    child: ChildOpt?;
}

struct ChildOpt {
    inner: Int?;
    leaf: LeafOpt?;
}

struct LeafOpt {
    val: Int?;
}

contract TestContract {
    nestedOpt: NestedOptionals;

    init() {
        self.nestedOpt = NestedOptionals{
            o1: null,
            o2: null,
            child: ChildOpt{
                inner: null,
                leaf: LeafOpt{ val: null }
            }
        };
    }
}