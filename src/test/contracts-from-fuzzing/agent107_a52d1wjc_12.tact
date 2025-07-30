struct BigOptNest {
    innerOpt: String?;
    intVal: Int;
    boolVal: Bool;
}

struct Top {
    nested: BigOptNest?;
}

contract OptNested {
    bigopt: Top;

    init() {
        self.bigopt = Top{
            nested: null
        };
    }
}