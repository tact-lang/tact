struct Deep3 {
    final: String?;
}
struct Deep2 {
    d3: Deep3;
}
struct Deep1 {
    d2: Deep2;
}

contract OptionalDeep {
    val: Deep1?;

    init() {
        self.val = null;
    }
}