struct Holder { a: Int }
struct OuterOptional { inr: Holder? }

contract NullContainer {
    oo: OuterOptional;

    init() {
        self.oo = OuterOptional{ inr: null };
    }
}