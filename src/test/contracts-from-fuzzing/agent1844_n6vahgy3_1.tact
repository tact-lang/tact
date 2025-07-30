struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Middle {
    i: Inner;
    flag: Bool;
}

contract NestedContract {
    data: Middle;

    init() {
        self.data = Middle{
            i: Inner{a:1, b:true, c:"hello"},
            flag: false
        };
    }
}