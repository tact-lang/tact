struct Inner {
    detail: String?;
}

struct HolderA {
    inner: Inner?;
}

struct HolderB {
    inner: Inner?;
}

struct Wrapper {
    a: HolderA?;
    b: HolderB?;
}

contract Test {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            a: HolderA{ inner: null },
            b: null,
        };
    }
}