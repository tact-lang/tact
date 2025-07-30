struct Trio {
    x: Int;
    y: Bool;
    z: String;
}

struct TrioW {
    a: Trio;
    b: Trio;
    c: Trio;
}

contract ManyTrios {
    dat: TrioW;

    init() {
        self.dat = TrioW{
            a: Trio{ x:1,y:true,z:"q" },
            b: Trio{ x:2,y:false,z:"w" },
            c: Trio{ x:3,y:true,z:"e" },
        };
    }

    receive() {
        let _ = self.dat;
    }
}