// interface null optional in nested
struct DeepIn {
    foo: String;
}

struct Wrap {
    nested: DeepIn?;
    alive: Bool;
}

contract OptionalDeepNull {
    s: Wrap;

    init() {
        self.s = Wrap{
            nested: null,
            alive: true
        };
    }
}