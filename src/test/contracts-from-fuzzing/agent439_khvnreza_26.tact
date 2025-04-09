struct One { f: Int }
struct Two { a: One; b: Int }
struct Three { a: Two; b: String }
struct Four { a: Three; b: Bool }

struct Container { nested: Four; opt: Int? }

contract Test26 {
    data: Container;

    init() {
        self.data = Container{
            nested: Four{
                a: Three{
                    a: Two{
                        a: One{f: 1},
                        b: 2,
                    },
                    b: "hi",
                },
                b: true,
            },
            opt: null,
        };
    }

    receive() {}
}