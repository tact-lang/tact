struct Param {
    a: Int;
    b: Bool;
}

struct Wrapper {
    param: Param;
    text: String;
}

contract SwapOrder {
    s: Wrapper;
    init() {
        self.s = Wrapper{
            text: "hello",
            param: Param{ a:5, b:true }
        };
    }
}