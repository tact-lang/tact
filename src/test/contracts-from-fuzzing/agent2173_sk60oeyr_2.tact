struct NestedDeep {
    l1: Int;
    optL2: Int?;
    l3: Int;
}

struct Container {
    st1: NestedDeep;
    st2: NestedDeep;
}

contract OptNestedTest {
    data: Container;

    init() {
        self.data = Container{
            st1: NestedDeep{ l1: 10, optL2: 20, l3: 30 },
            st2: NestedDeep{ l1: 11, optL2: null, l3: 33 },
        };
    }
}