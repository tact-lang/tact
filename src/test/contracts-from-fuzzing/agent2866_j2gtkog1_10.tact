struct Inner {
    st1: String;
    st2: String;
    flag: Bool;
    val: Int;
}

contract ManyStringsTest {
    a: Inner;
    b: Inner;

    init() {
        self.a = Inner{st1:"foo", st2:"bar", flag:true, val:42};
        self.b = Inner{st1:"baz", st2:"qux", flag:false, val:99};
    }

    receive() {}
}