struct Level1 { a: Int; }
struct Level2 { l1: Level1; b: Bool; }
struct Level3 { l2: Level2; c: String; }
struct Level4 { l3: Level3; d: Bool; }
struct Level5 { l4: Level4; e: Int; }

contract FiveNesting {
    nest: Level5;
    
    init() {
        self.nest = Level5{
            l4: Level4{
                l3: Level3{
                    l2: Level2{
                        l1: Level1{ a: 13 },
                        b: false
                    },
                    c: "deep"
                },
                d: true
            },
            e: 42
        };
    }
}