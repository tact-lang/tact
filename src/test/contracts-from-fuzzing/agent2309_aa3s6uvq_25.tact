// test multiple structs in one contract
struct A1 {x: Int;}
struct A2 {y: Int;}
struct A3 {z: Int;}

contract MultiStruct {
    one: A1;
    two: A2;
    three: A3;
    init() {
        self.one = A1{x:1};
        self.two = A2{y:2};
        self.three = A3{z:3};
    }
}