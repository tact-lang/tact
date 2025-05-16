struct EmptyNested {
    inner: Nested;
}

struct Nested {
    leaf1: Bool;
    leaf2: Int as uint32;
    leaf3: String;
    leaf4: Int?;
}

contract TestContract {
    deep: EmptyNested;

    init() {
        self.deep = EmptyNested{
            inner: Nested{
                leaf1:true,leaf2:12345,leaf3:"x",leaf4:null
            }
        };
    }
}
