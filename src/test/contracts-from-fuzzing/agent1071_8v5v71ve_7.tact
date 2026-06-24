struct Level1 {
    a: Int = 1;
}

struct Level2 {
    l1a: Level1;
    l1b: Level1;
}

struct Level3 {
    l2a: Level2;
    l2b: Level2;
}

struct Level4 {
    l3a: Level3;
    l3b: Level3;
}

contract Test8 {
    lv4: Level4 = Level4{
        l3a: Level3{
            l2a: Level2{ l1a: Level1{ a:11 }, l1b: Level1{ a:12 } },
            l2b: Level2{ l1a: Level1{ a:13 }, l1b: Level1{ a:14 } }
        },
        l3b: Level3{
            l2a: Level2{ l1a: Level1{ a:15 }, l1b: Level1{ a:16 } },
            l2b: Level2{ l1a: Level1{ a:17 }, l1b: Level1{ a:18 } }
        }
    };

    init() {
        self.lv4 = Level4{
            l3a: Level3{
                l2a: Level2{ l1a: Level1{ a:21 }, l1b: Level1{ a:22 } },
                l2b: Level2{ l1a: Level1{ a:23 }, l1b: Level1{ a:24 } }
            },
            l3b: Level3{
                l2a: Level2{ l1a: Level1{ a:25 }, l1b: Level1{ a:26 } },
                l2b: Level2{ l1a: Level1{ a:27 }, l1b: Level1{ a:28 } }
            }
        };
    }
}