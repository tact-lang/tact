struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

struct ContainOpt {
    oo: MultiOpt?;
    intVal: Int;
}

contract Test {
    field: ContainOpt;

    init() {
        self.field = ContainOpt{
            oo: null,
            intVal: 77,
        };
    }
}