struct L2 {
    a: Int;
}

struct L1 {
    arr1: L2;
    arr2: L2;
}

contract NestedContainers {
    layer: L1;

    init() {
        self.layer = L1{arr1:L2{a:1}, arr2:L2{a:2}};
    }
}