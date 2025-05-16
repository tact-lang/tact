struct DeeplyNested {
    opt: Inner?;
}

struct Inner {
    boolVal: Bool;
    intVal: Int;
}

contract TestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested { opt: null };
    }
}