struct MultiContainer {
    a: Int;
    b: ContainerB;
    c: ContainerC;
}

struct ContainerB {
    x: Int; y: Bool;
}

struct ContainerC {
    m: Int; n: Bool;
}

contract NestedContainers {
    val: MultiContainer;

    init() {
        self.val = MultiContainer{
            a: 77,
            b: ContainerB{ x: 1, y: true },
            c: ContainerC{ m: 2, n: false }
        };
    }
}