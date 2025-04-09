struct Deep {
    x: Int as uint8;
    y: Bool;
}

struct Outer {
    flag: Bool;
    nest: Deep?;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{ flag:true, nest:null };
    }
}