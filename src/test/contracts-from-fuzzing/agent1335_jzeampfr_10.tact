struct A {
    x: Int;
    y: Int?;
}

struct B {
    nestedA: A;
    str: String;
    maybeStr: String?;
}

contract CrossOptional {
    data: B;

    init() {
        self.data = B{
            nestedA: A{ x: 1, y: null },
            str: "hi",
            maybeStr: null
        };
    }
}