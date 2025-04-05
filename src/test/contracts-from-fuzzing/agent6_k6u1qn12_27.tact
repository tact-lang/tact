struct Outer {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Int;
}

contract Test {
    receive() {
        let x = Outer{ inner1: Inner1{a:1}, inner2: Inner2{b:2} };
    }
}