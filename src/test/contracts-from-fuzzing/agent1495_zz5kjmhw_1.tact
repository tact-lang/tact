struct NestedLevel2 {
    v: Int;
    flag: Bool;
}

struct NestedLevel1 {
    inner: NestedLevel2;
    s: String;
}

contract DeepNestTest {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            inner: NestedLevel2{v: 1, flag: true},
            s: "hi"
        };
    }
}
