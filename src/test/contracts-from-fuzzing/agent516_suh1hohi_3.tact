struct DeepNested {
    a: Int;
    b: Bool;
}

struct MidNested {
    x: Int?;
    y: DeepNested;
}

struct TopStruct {
    m: MidNested;
    q: Int;
}

contract PersistTest {
    store: TopStruct;

    init() {
        self.store = TopStruct{
            m: MidNested{ x: null, y: DeepNested{ a: 5, b: true } },
            q: 42
        };
    }
}
