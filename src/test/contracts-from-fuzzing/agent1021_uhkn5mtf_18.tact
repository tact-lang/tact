// deeply nested non-optional structs chain
struct Deep4 { v4: Int; }
struct Deep3 { d4: Deep4; }
struct Deep2 { d3: Deep3; }
struct Deep1 { d2: Deep2; }

contract DeepNest4 {
    root: Deep1 = Deep1{
        d2: Deep2{
            d3: Deep3{
                d4: Deep4{ v4: 99 },
            },
        },
    };
}