struct Deep1 { val1: Int; val2: Bool; val3: String; }
struct Deep2 { a: Deep1; b: Int; }
struct Deep3 { x: Deep2; y: Bool; }
struct Deep4 { m: Int; n: Deep3; o: String; }

contract TestContract {
    data: Deep4;

    init() {
        self.data = Deep4{
            m: 5,
            n: Deep3{
                x: Deep2{
                    a: Deep1{
                        val1: 42,
                        val2: true,
                        val3: "deep",
                    },
                    b: 7,
                },
                y: false,
            },
            o: "done",
        };
    }
}