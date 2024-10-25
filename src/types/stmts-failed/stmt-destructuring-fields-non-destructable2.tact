primitive Int;

trait BaseTrait {
    
}

struct S {
    a: Int;
    b: Int;
    c: Int;
}

contract Test {
    fun testFunc(): Int {
        let s = S{ a: 1, b: 2, c: 3 };
        let S { a, b, c } = self;
        return a + b + c;
    }
}