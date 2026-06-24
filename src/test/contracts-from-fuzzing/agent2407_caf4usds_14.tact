struct Inner {
    foo: Int;
    bar: Bool;
}

contract Reassign {
    val: Inner;

    init() {
        self.val = Inner{foo:1, bar:true};
        self.val = Inner{foo:2, bar:false};
    }
}