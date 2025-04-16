struct N {
    i: Int?;
}

contract OptionalStructField {
    f: N;

    init() {
        self.f = N{i:null};
    }
}