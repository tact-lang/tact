struct Sub {
    a: Int;
    b: Bool;
}

struct Mid {
    x: Sub;
    y: Sub;
}

contract Test46 {
    nest: Mid;

    init() {
        self.nest = Mid{
            x: Sub{ a:1, b:true },
            y: Sub{ a:2, b:false }
        };
    }
}