struct Opts {
    o1: Int?;
    o2: Bool?;
    o3: String?;
}

contract MultipleOptionals {
    settings: Opts;

    init() {
        self.settings = Opts{ o1: null, o2: null, o3: null };
    }
}