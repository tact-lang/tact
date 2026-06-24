// test optional struct fields with defaults
struct TryMe {
    foo: String = "default";
    bar: Bool = false;
    opt: Int?;
}

contract Test {
    f: TryMe;

    init() {
        self.f = TryMe{
            foo: "x",
            bar: true,
            opt: null
        };
    }
}