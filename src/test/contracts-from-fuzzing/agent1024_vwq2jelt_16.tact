struct ComposedOpt {
    field: Simple?;
}

struct Simple {
    value: Int;
}

contract ComposeOptional {
    composed: ComposedOpt;

    init() {
        self.composed = ComposedOpt{field:null};
    }
}