struct Inner1 {
    x: Int;
}
struct Inner2 {
    y: Bool;
}
struct Outer {
    a: Inner1;
    b: Inner2;
}

contract NestedMultiple {
    value: Outer;
    init() {
        self.value = Outer{
            a: Inner1{x:5},
            b: Inner2{y:true}
        };
    }
}
