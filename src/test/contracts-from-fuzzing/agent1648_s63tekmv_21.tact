// intentionally placing optional before and after required fields

struct OptionOrder {
    o1: Int?;
    r1: Int;
    o2: Int?;
    r2: Int;
    o3: Int?;
}

contract TestContract {
    field: OptionOrder;

    init() {
        self.field = OptionOrder{
            o1: null,
            r1: 5,
            o2: 6,
            r2: 7,
            o3: null
        };
    }
}