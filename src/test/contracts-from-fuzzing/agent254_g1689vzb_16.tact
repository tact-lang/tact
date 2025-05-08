struct BoolStringStruct {
    b: Bool;
    s: String;
}

contract BoolStringContract {
    field: BoolStringStruct;

    init() {
        self.field = BoolStringStruct{
            b: false,
            s: "abc"
        };
    }
}