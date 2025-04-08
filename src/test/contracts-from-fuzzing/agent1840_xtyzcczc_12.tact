struct Inner {
    f1: Int;
    f2: Bool;
}

struct OuterOne {
    nested: Inner;
    val: Int;
}

struct OuterTwo {
    nested: Inner;
    str: String;
}

contract MultiEmbed {
    one: OuterOne;
    two: OuterTwo;

    init() {
        self.one = OuterOne{ nested: Inner{f1:1, f2:false}, val:2 };
        self.two = OuterTwo{ nested: Inner{f1:3, f2:true}, str:"abc" };
    }
}