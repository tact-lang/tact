// Struct with many nested default optionals within optionals
struct Leaf {
    s:String?;
}

struct Mid {
    l:Leaf?;
}

contract TestContract {
    state:Mid?;

    init() {
        self.state = null;
    }
}