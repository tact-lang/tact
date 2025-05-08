struct Wrap {
    wrapped: Wrapped;
}

struct Wrapped {
    v: Int;
}

contract UseDefaults {
    my: Wrap = Wrap{wrapped: Wrapped{v:0}};

    init() {
        self.my = Wrap{
            wrapped: Wrapped{
                v: 42
            }
        };
    }
}
