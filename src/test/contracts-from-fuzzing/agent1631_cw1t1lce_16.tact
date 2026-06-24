struct Opts {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct Wrapping {
    inner1: Opts;
    inner2: Opts;
    inner3: Opts;
}

contract AllNulls {
    wrap: Wrapping;

    init() {
        self.wrap = Wrapping{
            inner1: Opts{ a:null, b:null, c:null },
            inner2: Opts{ a:null, b:null, c:null },
            inner3: Opts{ a:null, b:null, c:null },
        };
    }
}