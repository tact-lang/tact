// deeply nested optionals with structs
struct A { val: Int?; }
struct B { val: A?; }
struct C { val: B?; }

contract DeepOptionalChain {
    f: C?;
    init() {
        self.f = null;
    }
}