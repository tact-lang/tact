struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Int;
}

contract TwoStructs {
    f1: Inner1 = Inner1{x:1};
    f2: Inner2 = Inner2{y:2};
}