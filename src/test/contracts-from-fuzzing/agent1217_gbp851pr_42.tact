struct Inner2 {
    x: Int;
}

struct MidLayer {
    in2: Inner2;
}

struct Top {
    mid: MidLayer;
}

contract MultiLayer {
    everything: Top;

    init() {
        self.everything = Top{
            mid: MidLayer{
                in2: Inner2{x:10},
            },
        };
    }
}