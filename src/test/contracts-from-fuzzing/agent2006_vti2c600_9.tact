struct LargeNestA { x: Int; y: String; z: Int?; }
struct LargeNestB { a: LargeNestA; b: LargeNestA; c: Bool; d: LargeNestA; e: Bool; }
struct LargeNestC { m: LargeNestB; n: LargeNestB; o: LargeNestA; }

contract LargeNesting {
    mega: LargeNestC;
    init() {
        self.mega = LargeNestC {
            m: LargeNestB {
                a: LargeNestA { x:1, y: "a", z: null },
                b: LargeNestA { x:2, y: "b", z: null },
                c: true,
                d: LargeNestA { x:3, y: "c", z: null },
                e: false,
            },
            n: LargeNestB {
                a: LargeNestA { x:4, y: "d", z: null },
                b: LargeNestA { x:5, y: "e", z: null },
                c: false,
                d: LargeNestA { x:6, y: "f", z: null },
                e: true,
            },
            o: LargeNestA { x:7, y: "g", z: null },
        };
    }
}