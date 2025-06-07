struct EmptyOptionalFieldWrap {
    f1: Int?;
    f2: Int?;
}

contract PartialFillOptionals {
    wrapped: EmptyOptionalFieldWrap;

    init() {
        self.wrapped = EmptyOptionalFieldWrap{
            f1: null,
            f2: null,
        };
    }
}