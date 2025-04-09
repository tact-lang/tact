struct Deep1 {
    a: Int;
    b: Bool;
}
struct Deep2 {
    c: Deep1;
    d: Int?;
}
struct Deep3 {
    e: Deep2;
    f: Bool?;
}
struct Deep4 {
    g: Deep3;
    h: Deep2;
}
struct Deep5 {
    i: Deep4;
    j: Int;
}

contract FiveNested {
    nn: Deep5;

    init() {
        self.nn = Deep5{
            i: Deep4{
                g: Deep3{
                    e: Deep2{
                        c: Deep1{a:1,b:true},
                        d: null
                    },
                    f: null
                },
                h: Deep2{
                    c: Deep1{a:2,b:false},
                    d: null
                }
            },
            j: 42
        };
    }

    receive() {
        let tmp = self.nn;
    }
}