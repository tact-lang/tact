struct NestedArrayLike {
    item0: Int;
    item1: Int;
    item2: Int;
    item3: Int;
    item4: Int;
}

struct WrappedNestedArray {
    inner: NestedArrayLike;
    flag: Bool;
}

contract Persisted {
    data: WrappedNestedArray;

    init() {
        self.data = WrappedNestedArray {
            inner: NestedArrayLike {
                item0:1,item1:2,item2:3,item3:4,item4:5
            },
            flag: true
        };
    }
}