struct In1 { a: Int; b: String; }
struct In2 { c: Bool; d: In1; }
struct In3 { e: Bool?; f: In2; }

contract DiffNesting {
    state: In3;

    init() {
        self.state = In3{
            e: null,
            f: In2{
                c: true,
                d: In1{ a: 3, b: "hi" },
            },
        };
    }
}