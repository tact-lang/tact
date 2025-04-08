// Deep nested optional chain where leaf optional is null but parent chain is not null
struct Leaf {
    val: Int?;
}

struct Parent {
    child: Leaf?;
}

contract OptionalLeafNull {
    rec: Parent;

    init() {
        self.rec = Parent{
            child: null
        };
    }
}