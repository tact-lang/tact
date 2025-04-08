struct A1 { a: Int; b: Bool; }
struct A2 { c: Int?; d: String; }
struct A3 { e: Bool?; f: String?; }
struct A4 { g: A1; h: A2; i: A3; }

contract DeepLayers {
    data: A4;

    init() {
        self.data = A4{
            g: A1{ a: 1, b: false },
            h: A2{ c: null, d: "hey" },
            i: A3{ e: null, f: null }
        };
    }
}