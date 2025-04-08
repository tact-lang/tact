struct Layers {
    a: Int;
    b: Bool;
    c: Layer2;
}

struct Layer2 {
    d: Int?;
    e: String;
    f: Layer3;
}

struct Layer3 {
    g: Bool?;
    h: String?;
}

contract Multilevel {
    stuff: Layers;

    init() {
        self.stuff = Layers{
            a: 1,
            b: true,
            c: Layer2{
                d: null,
                e: "ok",
                f: Layer3{
                    g: true,
                    h: null
                }
            }
        };
    }
}
