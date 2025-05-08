struct StructStrOps {
    s1: String;
    s2: String?;
}

contract StructStrOpsTest {
    s: StructStrOps;

    init() {
        self.s = StructStrOps{ s1: "abc", s2: null };
    }
}
