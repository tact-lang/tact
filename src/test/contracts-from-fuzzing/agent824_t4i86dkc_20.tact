// contract with lots of nested optionals
struct Innermost { val: Int; }
struct Middle { optInner: Innermost?; }
struct Top { optMid: Middle?; }

contract TestContract {
    foo: Top?;
    init() {
        self.foo = Top{optMid: Middle{optInner: Innermost{val:7}}};
    }
}