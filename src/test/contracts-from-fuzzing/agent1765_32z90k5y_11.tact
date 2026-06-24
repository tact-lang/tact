struct Deep1 { val: Int?; }
struct Deep2 { deep1: Deep1?; }
struct Deep3 { deep2: Deep2?; }

contract OptionalDeepNest {
    deep3: Deep3?;

    init() {
        self.deep3 = null;
    }
}