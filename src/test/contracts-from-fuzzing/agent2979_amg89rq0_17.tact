struct Inner { a: Int; b: Int?; }

struct Outer { x: Inner; y: Inner?; }

contract NestedOptional {
    data: Outer;

    init() {
        self.data = Outer{ x: Inner{a:1, b:null}, y: null };
    }
}