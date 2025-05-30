struct InnerOpt {
    x: Int;
    y: Int?;
}

struct Outer {
    a: InnerOpt;
    b: InnerOpt?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{ a: InnerOpt{ x:1, y:null }, b: null };
    }
}
