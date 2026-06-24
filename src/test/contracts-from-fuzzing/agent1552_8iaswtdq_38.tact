struct OptStrRec {
    str: String?;
    i: Int;
}

contract OptionalString {
    field: OptStrRec;

    init() {
        self.field = OptStrRec{str:null,i:5};
    }
}