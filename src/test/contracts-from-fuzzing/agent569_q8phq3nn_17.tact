struct NestedOptional {
    x: Int?;
    y: Bool?;
    s: String?;
}

struct Outer {
    opt: NestedOptional?;
    val: Int;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            opt: null,
            val: 5
        };
    }
}