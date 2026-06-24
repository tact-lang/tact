struct Deep3 {
    val: String?;
}

struct Deep2 {
    node: Deep3;
}

struct Deep1 {
    node: Deep2;
}

contract TestContract {
    root: Deep1;

    init() {
        self.root = Deep1{
            node: Deep2{
                node: Deep3{ val: null }
            }
        };
    }
}