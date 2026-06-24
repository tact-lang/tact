// Compose deeply nested optionals inside deep nested structs
struct D4 { x: Int?; }
struct D3 { d: D4?; val: Int; }
struct D2 { d: D3?; flag: Bool; }
struct D1 { d: D2?; s: String; }

contract DeepCascade {
    state: D1;
    init() {
        self.state = D1{
            d:null,
            s:"deep"
        };
    }
}