struct A {
    val: Int;
}
struct B {
    a: A?;
}
struct C {
    b: B?;
}

contract TestContract {
    data: C;

    init() {
        self.data = C{ b: null };
    }
}