// Cross test: optionals with defaults nested mixed together

struct S2 {
    x: Int?;
    y: Bool = true;
}

struct S1 {
    nested: S2?;
    s: String = "txt";
}

contract CrossDefaultsOpt {
    data: S1;

    init() {
        self.data = S1{
            nested: null
        };
    }
}