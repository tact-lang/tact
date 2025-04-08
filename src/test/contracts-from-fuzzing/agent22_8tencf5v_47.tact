// Compose a 'tall' chain of structs with null defaults, override root init to null
struct Bottom {
    i: Int? = null;
}
struct Mid {
    bottom: Bottom? = null;
}
struct Tall {
    mid: Mid? = null;
}

contract TallNullChain {
    st: Tall? = null;

    init() {
        self.st = null;
    }
}