struct Alpha {
    p: Int;
    q: Bool;
}

struct Beta {
    alpha: Alpha?;
    r: String;
}

contract NestedOptStruct {
    beta: Beta?;

    init() {
        self.beta = null;
    }
}