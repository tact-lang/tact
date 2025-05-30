struct Child { x: Int; }

struct Parent { child: Child; arr1: Int; arr2: Int; arr3: Int; arr4: Int; }

contract NestedPlusFlat {
    store: Parent;

    init() {
        self.store = Parent{
            child: Child{ x: 10 },
            arr1:1, arr2:2, arr3:3, arr4:4
        };
    }
}