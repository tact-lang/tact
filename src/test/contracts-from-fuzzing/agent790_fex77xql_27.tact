struct SimpleOptional {
    opt: Int?;
}

contract OptionalInnerTest {
    field: SimpleOptional;

    init() {
        self.field = SimpleOptional{opt:null};
    }
}