struct Deep1 {
    val: Int?;
}

struct Deep2 {
    d1: Deep1;
}

struct Deep3 {
    d2: Deep2?;
}

contract Test {
    d3opt: Deep3?;

    init() {
        self.d3opt = null;
    }
}
