struct Opts {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract AllNulls {
    foo: Opts;

    init() {
        self.foo = Opts{x: null, y: null, z: null};
    }

    receive() {}
}