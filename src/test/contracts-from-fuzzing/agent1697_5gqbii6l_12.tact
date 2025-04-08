struct NestedManyFields {
    a: Int; b: Int; c: Int; d: Int; e: Int; f: Int;
}

struct Wrapper {
    inner: NestedManyFields;
}

contract TestContract {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            inner: NestedManyFields{
                a:1,b:2,c:3,d:4,e:5,f:6
            }
        };
    }
}