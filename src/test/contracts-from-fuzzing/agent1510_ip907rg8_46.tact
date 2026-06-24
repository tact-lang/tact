struct Weird {
    x: Int?;
    y: Inner?;
}

struct Inner {
    z: Int;
}

contract WeirdOpts {
    f: Weird;

    init() {
        self.f = Weird{x:null, y:null};
    }
}