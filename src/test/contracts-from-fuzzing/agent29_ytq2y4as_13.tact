struct MultiLayer1 { next: Int?; }
struct MultiLayer2 { next: MultiLayer1?; }
struct MultiLayer3 { next: MultiLayer2?; }
struct MultiLayer4 { next: MultiLayer3?; }
struct MultiLayer5 { next: MultiLayer4?; }

contract DeepLayers {
    root: MultiLayer5?;

    init() {
        self.root = null;
    }
}