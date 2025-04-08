// Edge case: only one giant struct deeply nested many levels

struct Level1 { child: Level2; }
struct Level2 { child: Level3; }
struct Level3 { child: Level4; }
struct Level4 { child: Level5; }
struct Level5 { child: Level6; }
struct Level6 { value: Int; }

contract VeryNested {
    root: Level1;

    init() {
        self.root = Level1{
            child: Level2{
                child: Level3{
                    child: Level4{
                        child: Level5{
                            child: Level6{
                                value: 123,
                            },
                        },
                    },
                },
            },
        };
    }
}