struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    c: Int;
    d: Bool;
}

struct Container {
    i1: Inner1;
    i2: Inner2;
}

contract MultiNested {
    val: Container = Container{
        i1: Inner1{ a:1, b:true },
        i2: Inner2{ c:2, d:false }
    };
}