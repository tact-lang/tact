struct HasManyOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
    opt4: String?;
    opt5: Cell?;
    opt6: Slice?;
    opt7: Builder?;
}

contract StructWithNulls {
    field: HasManyOptionals;

    init() {
        self.field = HasManyOptionals{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
            opt5: null,
            opt6: null,
            opt7: null,
        };
    }
}