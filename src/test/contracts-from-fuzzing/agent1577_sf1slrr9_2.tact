struct DeepNest1 { x: Int; y: Int?; }
struct DeepNest2 { inner: DeepNest1; flag: Bool; }
struct DeepNest3 { wrapped: DeepNest2; name: String; }

contract NestTest {
    complex: DeepNest3;

    init() {
        self.complex = DeepNest3{
            wrapped: DeepNest2{
                inner: DeepNest1{
                    x: 123,
                    y: null,
                },
                flag: true,
            },
            name: "hello",
        };
    }
}
