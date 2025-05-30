// Deep default initializers in nested structs
struct D1 { x: Int = 5; }
struct D2 { d1: D1; y: Int = 10; }
struct D3 { d2: D2; z: Int = 20; }

contract DeepDefaults {
    data: D3;

    init() {
        self.data = D3{
            d2: D2{
                d1: D1{},
                y: 123
            },
            z: 456
        };
    }
}