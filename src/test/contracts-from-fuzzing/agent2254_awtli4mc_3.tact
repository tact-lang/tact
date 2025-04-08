struct Nested {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
}

struct Top {
    nested1: Nested;
    nested2: Nested;
}

contract TestContract {
    field: Top;

    init() {
        self.field = Top{
            nested1: Nested{ intVal: 1, boolVal: true, addrVal: myAddress() },
            nested2: Nested{ intVal: 2, boolVal: false, addrVal: myAddress() }
        };
    }
}