struct DeepPoint {
    x: Int as int64;
    y: Int as int64;
}

struct OptionalPoint {
    point: DeepPoint?;
}

contract NestOptionalContract {
    pos: OptionalPoint;

    init() {
        self.pos = OptionalPoint{ point: null };
    }
}