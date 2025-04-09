struct Deep3 { d3a: Int; d3b: String?; }
struct Deep2 { d2a: Deep3; d2b: Int; }
struct Deep1 { d1a: Deep2; d1b: String; }

contract DeeplyNestedStructs {
    root: Deep1;

    init() {
        self.root = Deep1{
            d1a: Deep2{
                d2a: Deep3{
                    d3a: 7,
                    d3b: null,
                },
                d2b: 8,
            },
            d1b: "done",
        };
    }
}