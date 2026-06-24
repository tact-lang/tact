struct C { val: Int? }
struct B { c: C? }
struct A { b: B? }

contract LongOptFill {
    top: A?;

    init() {
        self.top = A{
            b: B{
                c: null
            }
        };
    }
}