struct NestedDefaultBools {
    inner: Inner;
}

struct Inner {
    a: Bool = true;
    b: Bool = false;
}

contract TestContract {
    data: NestedDefaultBools;

    init() {
        self.data = NestedDefaultBools{
            inner: Inner{}
        };
    }
}