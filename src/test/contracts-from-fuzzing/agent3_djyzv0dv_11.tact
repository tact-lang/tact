struct S { foo: Int? as uint8; }

contract TestContract {
    bar: S;

    init() {
        self.bar = S{ foo: null };
    }
}