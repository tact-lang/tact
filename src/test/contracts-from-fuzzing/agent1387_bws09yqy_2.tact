struct NestedLevel2 { x: Int; opt: Bool?; }

struct NestedLevel1 { inner: NestedLevel2; flag: Bool; }

contract MultiNested {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            inner: NestedLevel2{ x: 777, opt: null },
            flag: true,
        };
    }
}