struct A { x: Int; y: Bool; }
struct B { z: String; }

contract MultiVars {
    one: A;
    two: Int;
    three: B;

    init() {
        self.one = A{x:1, y:true};
        self.two = 42;
        self.three = B{z:"string"};
    }
}