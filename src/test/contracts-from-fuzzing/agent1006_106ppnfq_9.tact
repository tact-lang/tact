struct Param {
    a: Int;
    b: Bool;
}

struct Wrapper {
    p1: Param;
    p2: Param?;
}

contract TestContract {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            p1: Param{ a:123, b:true },
            p2: null
        };
    }
}
