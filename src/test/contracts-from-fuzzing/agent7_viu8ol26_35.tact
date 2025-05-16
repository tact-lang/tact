// nested optional with explicit null assignment in init
struct Leaf { val: Int; }

struct Middle {
    child: Leaf?;
}

struct Root {
    mid: Middle?;
}

contract InitNullNestedOpt {
    r: Root;
    init() {
        self.r = Root{ mid: null };
    }
}