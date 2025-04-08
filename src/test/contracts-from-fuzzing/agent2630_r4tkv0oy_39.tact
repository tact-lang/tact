struct InnerOptField {
    opt: Int?;
}

contract DefaultInnerOpt {
    i: InnerOptField;
    init() {
        self.i = InnerOptField{ opt: null };
    }
}