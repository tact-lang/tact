struct Tiny {
    foo: Int as uint4;
    bar: Int as uint4;
    baz: Int as uint4;
}

contract TestContract {
    tinyStruct: Tiny;

    init() {
        self.tinyStruct = Tiny{foo:1, bar:2, baz:3};
    }
}