struct Inner1 {
    v1: Int;
}
struct Inner2 {
    v2: Int;
}

struct Wrap {
    f1: Inner1;
    f2: Inner2;
}

contract WrappedStruct {
    main: Wrap;

    init() {
        self.main = Wrap{
            f1: Inner1{ v1: 5 },
            f2: Inner2{ v2: 6 },
        };
    }
}