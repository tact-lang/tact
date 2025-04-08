struct VeryDeep {
    level: Int;
    inner: Deep2;
}
struct Deep2 {
    v: Deep3;
}
struct Deep3 {
    w: Deep4;
}
struct Deep4 {
    x: Deep5;
}
struct Deep5 {
    y: Int;
}

contract Test {
    data: VeryDeep;
    init() {
        self.data = VeryDeep{
            level: 1,
            inner: Deep2{
                v: Deep3{
                    w: Deep4{
                        x: Deep5{
                            y: 42,
                        },
                    },
                },
            },
        };
    }
}
