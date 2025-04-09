struct Simple {
    a: Int = 0;
    b: String = "";
    c: Bool = false;
}

struct Nested {
    s1: Simple;
    s2: Simple;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            s1: Simple{ a:0, b:"", c:false },
            s2: Simple{ a:42, b:"hi", c:true },
        };
    }

    receive() {
        let _ = self.data;
    }
}