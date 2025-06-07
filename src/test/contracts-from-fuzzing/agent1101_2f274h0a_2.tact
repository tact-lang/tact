struct NestedLevel2 {
    a: Int;
    b: Bool?;
}

struct NestedLevel1 {
    inner: NestedLevel2;
    flag: Bool;
}

contract DeepContract {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            inner: NestedLevel2{ a: 5, b: null },
            flag: true
        };
    }
}