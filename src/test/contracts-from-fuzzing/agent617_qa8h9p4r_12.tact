struct Simple {
    a: Int;
    b: Int;
}

contract Defaults {
    data: Simple = Simple{ a:1, b:2 };
    init() {
        self.data = Simple{ a:10, b:20 };
    }
}