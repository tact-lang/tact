// Deep optional branch in nested struct chain
struct Y1 { x: Int?; }
struct Y2 { c: Y1?; }
struct Y3 { c: Y2?; }
struct Y4 { c: Y3?; }
struct Y5 { c: Y4?; }

contract DeepOptChain {
    info: Y5;

    init() {
        self.info = Y5{
            c: null
        };
    }
}
