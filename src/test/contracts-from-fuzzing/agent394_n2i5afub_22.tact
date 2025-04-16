struct Deep {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    opt: Deep?;

    init() {
        self.opt = null;
    }
}