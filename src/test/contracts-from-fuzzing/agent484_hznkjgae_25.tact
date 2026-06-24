struct X { a: Int?; b: Bool?; c: String? }

contract TestContract {
    foo: X?;
    bar: X?;

    init() {
        self.foo = null;
        self.bar = X{ a:null, b:null, c:null };
    }
}