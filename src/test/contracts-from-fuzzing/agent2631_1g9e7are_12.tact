struct Inner1 {
    x: Int;
}
struct Inner2 {
    y: Bool;
}

struct Compose {
    i1: Inner1;
    i2: Inner2;
}

contract StructOfStructs {
    s: Compose;

    init() {
        self.s = Compose{
            i1: Inner1{x:12},
            i2: Inner2{y:true}
        };
    }
}