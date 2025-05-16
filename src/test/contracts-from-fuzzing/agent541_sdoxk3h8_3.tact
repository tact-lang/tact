struct Sub {
    foo: Int;
    bar: Bool;
}

struct Wrapper {
    nested: Sub;
    optionalNested: Sub?;
}

contract StructsInStorage {
    s: Wrapper;

    init() {
        self.s = Wrapper{
            nested: Sub{foo: 1, bar: true},
            optionalNested: null,
        };
    }
}