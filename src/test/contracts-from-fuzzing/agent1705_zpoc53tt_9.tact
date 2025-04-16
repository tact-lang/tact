struct MultiNested1 { sub: MultiNested2 }
struct MultiNested2 { sub: MultiNested3 }
struct MultiNested3 { x: Int; y: Bool; z: String }

contract TestMult {
    fld: MultiNested1;

    init() {
        self.fld = MultiNested1{
            sub: MultiNested2{
                sub: MultiNested3{
                    x: 77,
                    y: true,
                    z: "deep",
                },
            },
        };
    }
}