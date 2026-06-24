struct NestedDeepInner2 {
    z: Int;
}

struct NestedDeepInner1 {
    y: NestedDeepInner2;
}

struct NestedDeep {
    x: NestedDeepInner1;
}

contract NestedDeepContract {
    n: NestedDeep;

    init() {
        self.n = NestedDeep {
            x: NestedDeepInner1 {
                y: NestedDeepInner2 {
                    z: 7
                }
            }
        };
    }
}