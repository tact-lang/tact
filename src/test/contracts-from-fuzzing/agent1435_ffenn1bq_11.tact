struct C { val: Int? }
struct B { c: C? }
struct A { b: B? }

contract LongOpt {
    top: A?;

    init() {
        self.top = null;
    }
}