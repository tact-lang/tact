struct One { a: Int; }
struct Two { a: One; }
struct Three { a: Two; }
struct Four { a: Three; }
struct Five { a: Four; }

contract VeryDeepChain {
    val: Five;

    init() {
        self.val = Five{ a: Four{ a: Three{ a: Two{ a: One{ a:7 } } } } };
    }
}