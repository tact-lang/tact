struct Opts {
    s: String?;
}

contract OptStructThenField {
    x: Opts;
    z: Int?;

    init() {
        self.x = Opts{s:null};
        self.z = null;
    }
}