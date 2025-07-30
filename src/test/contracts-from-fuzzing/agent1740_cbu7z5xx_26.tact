struct Opts {
    x: Int?;
    y: String?;
}

contract OptInStruct {
    data: Opts;

    init() {
        self.data = Opts { x: null, y: null };
    }
}