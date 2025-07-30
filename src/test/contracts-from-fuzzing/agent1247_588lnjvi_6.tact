struct ManyOptions {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Cell?;
    o5: Slice?;
}

contract MultiOptionalTest {
    inner: ManyOptions;

    init() {
        self.inner = ManyOptions{
            o1: null,
            o2: true,
            o3: "hello",
            o4: null,
            o5: null
        };
    }
}