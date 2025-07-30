struct Deep {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    opt: Deep?;

    init() {
        self.opt = Deep{ foo: null, bar: true };
    }
}