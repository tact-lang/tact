struct InnerRem {
    data: Cell as remaining;
}

struct OuterInvalid {
    first: Int;
    nested: InnerRem;
    last: Int;
}

contract NestedRemainingInvalid {
    field: OuterInvalid;

    init() {
        self.field = OuterInvalid{
            first: 1,
            nested: InnerRem{data: emptyCell()},
            last: 2,
        };
    }
}
