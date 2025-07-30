struct A { a: Int; }
struct B { b: Int; }
struct AB { x: A; y: B; }

contract OptionalNestedStruct {
    opt: AB?;

    init() {
        self.opt = AB{ x: A{a:1}, y: B{b:2} };
    }
}