struct A {
    b: B?;
}
struct B {
    c: C?;
}
struct C {
    v: Int;
}
contract ManyOptionLayers {
    f: A = A{b:null};
}