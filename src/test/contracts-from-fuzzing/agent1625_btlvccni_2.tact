struct NestedLevel2 {
    d: Bool?;
}

struct NestedLevel1 {
    c: NestedLevel2;
}

struct Container {
    a: Int;
    b: NestedLevel1;
}

contract DeepNestedTest {
    persist: Container;

    init() {
        self.persist = Container{
            a: 5,
            b: NestedLevel1{
                c: NestedLevel2{
                    d: null
                }
            }
        };
    }
}
