// Optional struct field + default value inside struct
struct WithDefaults {
    x: Int = 10;
    y: String = "default";
    z: Bool?; // implicitly null
}

contract StorageTest {
    inner: WithDefaults?;

    init() {
        self.inner = WithDefaults{
            x: 5,
            y: "hello",
            z: true
        };
    }
}