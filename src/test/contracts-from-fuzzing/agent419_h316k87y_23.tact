// nested struct containing optional string + optional slice
struct Nest {
    s: String?;
    sl: Slice?;
}

contract OptionalNest {
    x: Nest;

    init() {
        self.x = Nest{ s:null, sl:null };
    }
}