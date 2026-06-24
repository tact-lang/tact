struct Simple {
    a: Int;
    b: Bool;
}

contract MixedNestedOptions {
    one: Simple?;
    two: Simple;
    three: Simple?;

    init() {
        self.one = null;
        self.two = Simple{ a:1, b:true };
        self.three = Simple{ a:2, b:false };
    }
}
