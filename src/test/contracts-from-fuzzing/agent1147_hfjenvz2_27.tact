// two optional nested structs
struct A { num:Int; }
struct B { sub:A?; }
struct C { subB:B?; value:Int; }

contract TestContract {
    val:C;

    init() {
        self.val = C{ subB:null, value:5 };
    }
}