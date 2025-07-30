struct Nested {
    inner: Inner2;
}

struct Inner2 {
    flag: Bool;
    optNum: Int?;
}

contract DeepNestedStruct {
    data: Nested;

    init() {
        self.data = Nested{
            inner: Inner2{
                flag: true,
                optNum: null
            }
        };
    }

    receive() {
        self.data = Nested{
            inner: Inner2{
                flag: false,
                optNum: 99
            }
        };
    }
}