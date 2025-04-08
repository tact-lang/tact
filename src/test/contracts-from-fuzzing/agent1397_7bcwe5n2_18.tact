struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Int?;
}

contract TestContract {
    val: NestedOptionals;

    init() {
        self.val = NestedOptionals{
            a: null,
            b: null,
            c: null,
            d: 12,
        };
    }

    receive() {
        let _ = self.val.a;
        let _ = self.val.b;
        let _ = self.val.c;
        let _ = self.val.d;
    }
}