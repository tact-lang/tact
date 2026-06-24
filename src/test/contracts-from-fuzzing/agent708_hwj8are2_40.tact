struct Rec {
    val: Int;
}

struct Boxed {
    item: Rec?;
}

struct Wrapper {
    data: Boxed?;
}

contract BoxNest {
    root: Wrapper;
    init() {
        self.root = Wrapper{ data: null };
    }
}