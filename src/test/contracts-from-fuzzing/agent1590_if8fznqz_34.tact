struct Tuple1 {
    a: Int;
    b: Bool;
}

struct Wrapper {
    t1: Tuple1;
    flag: Bool;
}

contract WrappedFields {
    val: Wrapper;
    init() {
        self.val = Wrapper{
            t1: Tuple1{
                a:42,
                b:true
            },
            flag:false
        };
    }
}