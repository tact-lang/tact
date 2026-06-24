struct ManyLayer0 { a: Int }
struct ManyLayer1 { b: ManyLayer0 }
struct ManyLayer2 { c: ManyLayer1 }
struct ManyLayer3 { d: ManyLayer2 }

contract SerialLayers {
    val: ManyLayer3;

    init() {
        self.val = ManyLayer3{ d: ManyLayer2{ c: ManyLayer1{ b: ManyLayer0{ a: 5 } } } };
    }
}