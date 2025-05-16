// contract with struct containing nested struct with interleaved optionals, with optional at root too
struct Segment {
    x: Int;
    y: Int?;
}

struct Container {
    s: Segment;
    flag: Bool?;
}

contract OptionalContainer {
    data: Container?;

    init() {
        self.data = null;
    }
}