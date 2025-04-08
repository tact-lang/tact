struct WrappedOptional {
    opt: Int?;
}

contract WrapOptField {
    data: WrappedOptional;
    init() {
        self.data = WrappedOptional{opt:null};
    }
}