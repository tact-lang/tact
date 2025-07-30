struct A {
    a: Int;
    b: String;
}

contract TwoStructVars {
    first: A;
    second: A;

    init() {
        self.first = A{
            a:1,
            b:"x"
        };
        self.second = A{
            a:2,
            b:"y"
        };
    }
}
