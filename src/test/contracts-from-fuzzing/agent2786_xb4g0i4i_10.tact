struct LargeNested {
 a: L1; b: L1; c: L1; d: L1; e: L1;
}
struct L1 { f: L2; g: L2; }
struct L2 { h: L3; i: L3; }
struct L3 { x: Int; y: Int; }

contract ComplexStorage {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            a: L1{ f: L2{ h: L3{ x:1,y:2 }, i: L3{ x:3,y:4 } }, g: L2{ h: L3{ x:5,y:6 }, i: L3{ x:7,y:8 } } },
            b: L1{ f: L2{ h: L3{ x:9,y:10 }, i: L3{ x:11,y:12 } }, g: L2{ h: L3{ x:13,y:14 }, i: L3{ x:15,y:16 } } },
            c: L1{ f: L2{ h: L3{ x:17,y:18 }, i: L3{ x:19,y:20 } }, g: L2{ h: L3{ x:21,y:22 }, i: L3{ x:23,y:24 } } },
            d: L1{ f: L2{ h: L3{ x:25,y:26 }, i: L3{ x:27,y:28 } }, g: L2{ h: L3{ x:29,y:30 }, i: L3{ x:31,y:32 } } },
            e: L1{ f: L2{ h: L3{ x:33,y:34 }, i: L3{ x:35,y:36 } }, g: L2{ h: L3{ x:37,y:38 }, i: L3{ x:39,y:40 } } }
        };
    }
}