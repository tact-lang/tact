struct SNest {
    inner: String?;
    bools: Bool;
}

struct SNestWrap {
    nested: SNest?;
    intVal: Int;
}

contract TestContract {
    wrap: SNestWrap;

    init() {
        self.wrap = SNestWrap {
            nested: SNest {
                inner: null,
                bools: true,
            },
            intVal: 55,
        };
    }
}