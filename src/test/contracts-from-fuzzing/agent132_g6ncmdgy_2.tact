struct Inner { x: Int; }

struct Outer { nested: Inner; val: Int; }

contract NestTest {
    info: Outer;
    
    init() {
        self.info = Outer{ nested: Inner{ x: 5 }, val: 10 };
    }
}