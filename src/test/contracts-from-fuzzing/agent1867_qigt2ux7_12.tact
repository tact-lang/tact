struct SOptional {
    f1: Int?;
}

contract OptionalDefault {
    data: SOptional;
    init() {
        self.data = SOptional{f1:null};
    }
}