struct NestedWithOptDefault { i: Int? = null; }

contract OptDefaultTest {
    f: NestedWithOptDefault;
    init() {
        self.f = NestedWithOptDefault{};
    }
}