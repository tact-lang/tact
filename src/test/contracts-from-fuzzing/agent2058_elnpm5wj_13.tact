// optional struct type as field inside another struct
struct SOpt {
    foo: Int;
    bar: Bool;
}

struct Wrapper {
    inner: SOpt?;
    num: Int;
}

contract Test {
    w: Wrapper;
    
    init() {
        self.w = Wrapper{
            inner: null,
            num: 42
        };
    }
}