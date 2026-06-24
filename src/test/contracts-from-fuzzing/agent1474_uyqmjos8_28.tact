// serialization with optional and int size
struct SerOpt {
    small: Int? as uint4;
}

contract Test27 {
    f: SerOpt;
    init() {
        self.f = SerOpt{ small: null };
    }
}