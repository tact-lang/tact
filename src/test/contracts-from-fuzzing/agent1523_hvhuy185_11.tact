contract TestContract {
    fieldA: Slice;
    fieldB: Cell;

    init() {
        self.fieldA = emptyCell().asSlice();
        self.fieldB = emptyCell();
    }

    get fun getFields(): FieldsStruct {
        return FieldsStruct{
            s: self.fieldA,
            c: self.fieldB
        };
    }
}

struct FieldsStruct {
    s: Slice;
    c: Cell;
}
