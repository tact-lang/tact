// deeply nest composite struct with many fields, including optionals
struct LeafA { val: Int }
struct LeafB { val: Bool }

struct Mid1 { leafA: LeafA; leafB: LeafB; }
struct Mid2 { m1: Mid1; flag: Bool; optInt: Int?; }
struct Mid3 { m2: Mid2; text: String; optLeaf: LeafA?; }

struct Root {
    m3: Mid3;
    addr: Address;
    optFlag: Bool?;
    info: String;
}

contract DeepHuge {
    store: Root;
    init() {
        self.store = Root{
            m3: Mid3{
                m2: Mid2{
                    m1: Mid1{
                        leafA: LeafA{val: 7},
                        leafB: LeafB{val: false}
                    },
                    flag: true,
                    optInt: null
                },
                text: "deep",
                optLeaf: null
            },
            addr: myAddress(),
            optFlag: null,
            info: "info"
        };
    }
}