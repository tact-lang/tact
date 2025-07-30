struct HasOptionalCell {
    payload: Cell?;
    comment: String;
}

contract TestContract {
    s: HasOptionalCell;

    init() {
        self.s = HasOptionalCell{
            payload: null,
            comment: "hi"
        };
    }
}