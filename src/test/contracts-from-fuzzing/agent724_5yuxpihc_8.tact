struct Levels3 {
    a: Int;
    b: String;
    c: Bool?;
}

struct Levels2 {
    a: Levels3; 
    b: Int?;
}

struct Levels1 {
    x: Levels2;
    y: Int;
}

contract MultipleLevels {
    foo: Levels1;

    init() {
        self.foo = Levels1{
            x: Levels2{a: Levels3{a:1,b:"b",c:true}, b:null},
            y:2
        };
    }
}