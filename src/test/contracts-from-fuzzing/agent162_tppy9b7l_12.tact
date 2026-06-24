struct Inner1 { b: Bool }
struct Inner2 { val: Inner1 }

contract OptionalNestedContract {
    opt: Inner2?;

    init() {
        self.opt = Inner2{
            val: Inner1{ b: true }
        };
    }
}