struct Deep1 { x: Int; y: String; }
struct Deep2 { d1: Deep1; flag: Bool; opt: Int?; }
struct Deep3 { d2: Deep2; s: String; }
struct Deep4 { d3: Deep3; number: Int; }

contract Deepest {
    data: Deep4;

    init() {
        self.data = Deep4{
            d3: Deep3{
                d2: Deep2{
                    d1: Deep1{ x: 1, y: "y" },
                    flag: false,
                    opt: null,
                },
                s: "test",
            },
            number: 42,
        };
    }
}