struct Deep3 { x: Int; }

struct Deep2 { deep3: Deep3?; }

struct Deep1 { deep2: Deep2?; }

contract NestedOptionalsExtreme {
    val: Deep1?;

    init() {
        self.val = null;
    }
}