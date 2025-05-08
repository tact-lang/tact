struct DeepNested {
    a: Int?;
}

struct MidNested {
    inner: DeepNested;
}

contract DeepTest {
    deep: MidNested;

    init() {
        self.deep = MidNested{ inner: DeepNested{ a: null } };
    }
}
