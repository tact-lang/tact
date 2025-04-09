struct In1 { x: Int }
struct In2 { y: Bool }
struct Out1 {
    a: In1;
    b: In2;
}

contract Test27 {
    o: Out1;
    init() {
        self.o = Out1{
            a: In1{x:1},
            b: In2{y:true}
        };
    }
}
