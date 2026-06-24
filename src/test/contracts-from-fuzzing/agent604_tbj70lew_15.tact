struct Mid {
    s1: String;
    s2: Bool;
    s3: Int;
}

struct OuterOptions {
    a: Mid?;
    b: Mid?;
    c: Mid?;
}

contract NestedOptionalStructs {
    n: OuterOptions;

    init() {
        self.n = OuterOptions{
            a: null,
            b: null,
            c: null,
        };
    }

    receive() {
        let _ = self.n;
    }
}