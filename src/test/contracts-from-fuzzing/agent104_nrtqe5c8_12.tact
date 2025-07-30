struct EmptyOptionStruct {
    opt: Int?;
}

contract FieldOnlyOptional {
    foo: EmptyOptionStruct;

    init() {
        self.foo = EmptyOptionStruct{ opt: null };
    }
}