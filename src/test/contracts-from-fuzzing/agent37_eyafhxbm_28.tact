struct Sub {
    x: Int;
    y: Bool;
}

struct Outer {
    sub1: Sub;
    sub2: Sub;
    sub3: Sub;
}

contract TestContract {
    o: Outer = Outer{
        sub1:Sub{x:1,y:true},
        sub2:Sub{x:2,y:false},
        sub3:Sub{x:3,y:true}
    };

    init(){
        self.o = Outer{
            sub1:Sub{x:11,y:false},
            sub2:Sub{x:12,y:true},
            sub3:Sub{x:13,y:false}
        };
    }
    receive() {}
}