struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Wrapper {
    f1: Inner;
    f2: Inner;
    f3: Inner;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            f1: Inner{a:1,b:true,c:"a"},
            f2: Inner{a:2,b:false,c:"b"},
            f3: Inner{a:3,b:true,c:"c"}
        };
    }
}