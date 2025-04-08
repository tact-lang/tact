struct NestedSer2 {
    inn: Inner2;
}

struct Inner2 {
    foo: Int as uint64;
    bar: Bool?;
}

contract NestedSerializeTwo {
    val: NestedSer2;
    init() {
        self.val = NestedSer2{
            inn: Inner2{ foo:55, bar:null }
        };
    }
}