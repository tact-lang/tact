struct CS1 {
    f: Bool;
}

struct CS2 {
    ca: CS1;
    cb: CS1;
}

contract ManyNestedSameKind {
    val: CS2;
    init() {
        self.val = CS2{
            ca: CS1{f:true},
            cb: CS1{f:false}
        };
    }
}