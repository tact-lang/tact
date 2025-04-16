struct TrailingOptional {
    f1: Int;
    f2: String;
    maybe: Int?; 
}

contract TestTrailingOptional {
    data: TrailingOptional;

    init() {
        self.data = TrailingOptional{
            f1: 1,
            f2: "hi",
            maybe: null
        };
    }
}