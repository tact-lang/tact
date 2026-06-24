struct Info {
    score: Int?;
}

struct Container {
    sub: Info?;
}

contract TestContract {
    root: Container?;

    init() {
        self.root = null;
    }
}