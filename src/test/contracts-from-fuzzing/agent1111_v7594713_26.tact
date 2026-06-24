// test nested bools and ints with optional fields
struct A { f:Int; b:Bool; }
struct B { inner:A?; }
contract NestedBoolIntOptional {
    q: B?;
    init() {
        self.q = B{inner: A{f:3,b:false}};
    }
}