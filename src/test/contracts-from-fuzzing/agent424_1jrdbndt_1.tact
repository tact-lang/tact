struct Inner1 {
    val1: Int;
    val2: Bool;
}

struct Inner2 {
    inner1: Inner1;
    optVal: String?;
}

contract NestedStructStorage {
    data: Inner2;
    
    init() {
        self.data = Inner2{
            inner1: Inner1{val1: 42, val2: true},
            optVal: null,
        };
    }
}