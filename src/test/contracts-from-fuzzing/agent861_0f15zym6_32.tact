struct A { x:Int; }
struct B { y:Int; a:A; }

struct C {
    one: B?;
    two: A?;
    num: Int;
}

contract MultiOptNested {
    data: C;

    init() {
        self.data = C{ one:null, two:null, num:5 };
    }

    receive() {
        let _ = self.data;
    }
}