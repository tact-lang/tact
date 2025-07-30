struct Middle {
    a:Int;
    b:Int;
}

struct Outer {
    mid:Middle;
}

contract MidNested {
    outer:Outer;
    init(){
        self.outer=Outer{mid:Middle{a:1,b:2}};
    }
}