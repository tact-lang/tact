struct Wrapper {
    a: Int;
    opt: Inner?;
}

struct Inner {
    b: Bool;
}

contract OptionalStructInStruct {
    val: Wrapper;

    init() {
        self.val = Wrapper{a:5,opt:Inner{b:true}};
    }
}
