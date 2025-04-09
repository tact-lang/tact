struct Strange {
    id: Int;
    tail: Slice? = null;
}

struct OuterStrange {
    part: Int;
    str: Strange;
}

contract NestedRemainingOptional {
    nested: OuterStrange = OuterStrange{
        part: 1,
        str: Strange{ id: 5, tail: null }
    };

    init() {
        self.nested = OuterStrange{
            part: 2,
            str: Strange{ id: 10, tail: emptyCell().asSlice() }
        };
    }

    receive() {}
}