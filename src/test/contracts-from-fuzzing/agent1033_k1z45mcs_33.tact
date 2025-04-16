struct AA { a: Int; }
struct AB { a: AA; }
struct AC { a: AB; }

contract ChainFields {
    val: AC;

    init() {
        self.val = AC{ a: AB{ a: AA{ a: 42 } } };
    }
}