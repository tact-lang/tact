struct DeepMix {
    a: Int;
    b: Bool;
    c: Slice;
    d: String;
    e: Cell;
}

struct Wrap1 {
    m: DeepMix;
    x: Int;
}

struct Wrap2 {
    w: Wrap1;
    z: Bool;
}

contract MultiNest {
    data: Wrap2;

    init() {
        self.data = Wrap2{
            w: Wrap1{
                m: DeepMix{a:1,b:true,c:emptyCell().asSlice(),d:"abc",e:emptyCell()},
                x: 50
            },
            z: false
        };
    }
}
