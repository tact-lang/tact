struct Inner1 { a: Int; b: Bool; }
struct Inner2 { x: String; y: Bool; }
struct Container {
    in1: Inner1;
    in2: Inner2;
    someInt: Int;
    someStr: String;
}

contract NestMix {
    cont: Container;

    init() {
        self.cont = Container{
            in1: Inner1{a:1,b:true},
            in2: Inner2{x:"hi", y:false},
            someInt:123,
            someStr:"test"
        };
    }
}
