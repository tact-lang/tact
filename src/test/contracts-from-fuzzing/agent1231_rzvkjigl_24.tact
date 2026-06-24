struct Deep {
    a: Int? as int64;
    b: Bool?;
    c: Int as uint32;
}

contract TestContract {
    opt: Deep?;

    init() {
        self.opt = Deep{
            a: null,
            b: true,
            c: 777
        };
    }
}
