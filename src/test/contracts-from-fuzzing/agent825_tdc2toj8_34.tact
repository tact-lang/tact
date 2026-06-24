// nested mixed optional/default cases
struct A { x: Int?=null; }
struct B { a: A?=null; b: Bool?=null; }
struct C { b: B?=null; c: String?=null; }

contract MixedChain {
    c: C?=null;

    init() {
        self.c = null;
    }
}