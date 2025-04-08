struct DeepOpt {
    flag: Bool?; // null default
    name: String = "Z";
    count: Int?; // null default
}

struct Outer {
    inner: DeepOpt?; // null default
    note: String = "outer";
}

contract TestContract {
    meta: Outer;

    init() {
        self.meta = Outer{
            // omit inner -> default null
            // omit note -> default 'outer'
        };
    }
}