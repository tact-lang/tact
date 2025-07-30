struct A1 {x: Int;}
struct A2 {x: A1;}
struct A3 {x: A2;}
struct A4 {x: A3;}
struct A5 {x: A4;}
contract DeepFive {
    foo: A5;
    init() {
        self.foo = A5{x:A4{x:A3{x:A2{x:A1{x:1}}}}};
    }
    receive() {
        self.foo.x.x.x.x.x += 1;
    }
}