struct ChainA {
    a: Int;
    next: ChainB?;
}

struct ChainB {
    b: Bool;
    next: ChainC?;
}

struct ChainC {
    c: String;
}

contract TestContract {
    value: ChainA;

    init() {
        self.value = ChainA{
            a:1,
            next: ChainB{
                b:true,
                next: ChainC{c: "end"}
            }
        };
    }
}