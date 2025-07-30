struct Inner1 {
    f1: Int;
}
struct Inner2 {
    f2: Int;
}
struct Inner3 {
    f3: Int;
}
struct Container {
    a: Inner1;
    b: Inner2;
    c: Inner3;
}

contract MultipleStructs {
    cont: Container;
    init() {
        self.cont = Container{
            a: Inner1{f1:1}, b: Inner2{f2:2}, c: Inner3{f3:3}
        };
    }
}