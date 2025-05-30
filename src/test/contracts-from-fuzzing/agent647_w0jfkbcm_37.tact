// large nested struct with many fields in multiple levels
struct Level3 {
    a: Int; b: Int; c: Int; d: Int; e: Int;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
    l3c: Level3;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1{
            l2a: Level2{
                l3a: Level3{ a:1,b:2,c:3,d:4,e:5 },
                l3b: Level3{ a:6,b:7,c:8,d:9,e:10 },
                l3c: Level3{ a:11,b:12,c:13,d:14,e:15 }
            },
            l2b: Level2{
                l3a: Level3{ a:16,b:17,c:18,d:19,e:20 },
                l3b: Level3{ a:21,b:22,c:23,d:24,e:25 },
                l3c: Level3{ a:26,b:27,c:28,d:29,e:30 }
            }
        };
    }
}