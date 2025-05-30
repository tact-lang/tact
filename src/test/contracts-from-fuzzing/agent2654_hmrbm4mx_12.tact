struct Inner1 { x: Int; }
struct Inner2 { y: Bool; }
struct Inner3 { z: String; }

struct Combined {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
}

contract MultiNestedStructs {
    c: Combined;

    init() {
        self.c = Combined{
            i1: Inner1{x:1},
            i2: Inner2{y:true},
            i3: Inner3{z:"z"}
        };
    }
}