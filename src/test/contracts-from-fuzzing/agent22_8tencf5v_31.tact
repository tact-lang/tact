// Testing contract persistent fields of nested structs with complex default assignments
struct A {
    x:Int = 15;
    y:String? = null;
}

struct B {
    sub:A? = null;
    flag:Bool = false;
}

contract ComplexDefaults {
    s:B;

    init() {
        self.s = B{};
    }
}