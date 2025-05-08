struct ManyNestedOpts {
    a: Int?;
    b: String?;
}

struct Nest1 {
    m: ManyNestedOpts?;
}

contract NestedOptLevels {
    data: Nest1;

    init() {
        self.data = Nest1{ m: null };
    }
}
