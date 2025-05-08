struct Deep {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
}

struct Mid {
    x: Deep;
    y: Deep;
}

struct Container {
    m1: Mid;
    m2: Mid;
    m3: Mid;
}

contract TestContract {
    v: Container;

    init() {
        self.v = Container{
            m1: Mid{ x:Deep{a:1,b:true,c:"a",d:emptyCell()}, y:Deep{a:2,b:false,c:"b",d:emptyCell()} },
            m2: Mid{ x:Deep{a:3,b:true,c:"c",d:emptyCell()}, y:Deep{a:4,b:false,c:"d",d:emptyCell()} },
            m3: Mid{ x:Deep{a:5,b:true,c:"e",d:emptyCell()}, y:Deep{a:6,b:false,c:"f",d:emptyCell()} }
        };
    }
}