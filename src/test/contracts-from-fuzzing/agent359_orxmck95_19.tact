struct Inner1 {
    a: Int?;
    b: Bool;
}

struct Inner2 {
    c: String?;
    d: Bool?;
}

struct AllIn {
    in1: Inner1;
    in2: Inner2;
    e: String;
    f: Int?;
    g: Bool;
    h: String?;
}

contract TestContract {
    combined: AllIn;

    init() {
        self.combined = AllIn{
            in1: Inner1{ a: null, b: true },
            in2: Inner2{ c: null, d: false },
            e: "hi",
            f: null,
            g: true,
            h: null
        };
    }
}