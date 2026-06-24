struct Deep1 { x: Int; }
struct Deep2 { d1: Deep1; y: Bool; }
struct Deep3 { d2: Deep2; z: String; }
struct Deep4 { d3: Deep3; u: Address; }

contract TestContract {
    info: Deep4;
    init() {
        self.info = Deep4{
            d3: Deep3{
                d2: Deep2{
                    d1: Deep1{ x: 123 },
                    y: true
                },
                z: "hello"
            },
            u: myAddress()
        };
    }
}