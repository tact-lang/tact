struct SerOrder {
    alpha: Int as uint32;
    beta: Int as int8;
    gamma: Bool;
    delta: String;
}

contract SerializationOrdering {
    s: SerOrder;
    init() {
        self.s = SerOrder{
            alpha: 1,
            beta: -5,
            gamma: true,
            delta: "ordering"
        };
    }
}