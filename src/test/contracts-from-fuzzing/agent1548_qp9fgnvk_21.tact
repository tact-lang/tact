// test missing opt assignment (should default null)
struct TryMe {
    foo: String = "default";
    bar: Bool = false;
    opt: Int?;
}

contract Test {
    f: TryMe;

    init() {
        self.f = TryMe{
            foo: "set",
            bar: true
        };
    }
}