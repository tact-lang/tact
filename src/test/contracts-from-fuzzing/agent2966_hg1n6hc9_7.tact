struct Layer1 { a: Int; b: String; }
struct Layer2 { l1: Layer1; c: Bool; d: String; }
struct Layer3 { l2: Layer2; e: Int; f: Bool; }

contract Layers {
    big: Layer3;

    init() {
        self.big = Layer3{
            l2: Layer2{
                l1: Layer1{ a: 5, b: "five" },
                c: false,
                d: "dee",
            },
            e: 100,
            f: true,
        };
    }
}
