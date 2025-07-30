struct WithSerialization {
    ai: Int as int64;
    ui: Int as uint64;
    big: Int;
    s: String;
    b: Bool;
}

contract SerializeStructTest {
    val: WithSerialization;
    init() {
        self.val = WithSerialization{
            ai: -123456789,
            ui: 123456789,
            big: -1,
            s: "test",
            b: true,
        };
    }
}