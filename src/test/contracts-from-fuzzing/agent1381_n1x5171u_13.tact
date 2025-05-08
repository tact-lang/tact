struct A { foo: Int; bar: String; }

contract OrderMatters {
    one: A;
    two: A;

    init() {
        self.one = A{ foo: 1, bar: "x" };
        self.two = A{ foo: 2, bar: "y" };
    }
}