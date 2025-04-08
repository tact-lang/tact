struct Deep1 { a: Int }
struct Deep2 { d1: Deep1; b: Bool }
struct Deep3 { d2: Deep2; s: String }
struct Deep4 { d3: Deep3; addr: Address }

contract TestContract {
    deepNest: Deep4;

    init() {
        self.deepNest = Deep4{
            d3: Deep3{
                d2: Deep2{
                    d1: Deep1{ a: 42 },
                    b: true
                },
                s: "hi"
            },
            addr: myAddress()
        };
    }

    receive() {}
}