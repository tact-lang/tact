struct Lvl1 { a: Int }
struct Lvl2 { b: Int; nested: Lvl1 }
struct Lvl3 { c: Int; nested: Lvl2 }
struct Lvl4 { d: Int; nested: Lvl3 }
struct Lvl5 { e: Int; nested: Lvl4 }
struct Lvl6 { f: Int; nested: Lvl5 }

contract DeepChain {
    val: Lvl6;

    init() {
        self.val = Lvl6{
            f: 6,
            nested: Lvl5{
                e: 5,
                nested: Lvl4{
                    d: 4,
                    nested: Lvl3{
                        c:3,
                        nested: Lvl2{
                            b:2,
                            nested: Lvl1{
                                a:1,
                            },
                        },
                    },
                },
            },
        };
    }
}