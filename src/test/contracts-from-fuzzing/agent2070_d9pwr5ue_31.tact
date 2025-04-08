struct OptionalCell {
    data: Cell?;
}

contract HasOptionalCell {
    c: OptionalCell;

    init() {
        self.c = OptionalCell{
            data: null
        };
    }
}