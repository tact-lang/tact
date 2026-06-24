struct Big {
    x: Int;
    y: Int;
    z: Int;
    s: String;
}

struct Container {
    big1: Big;
    big2: Big;
}

contract DoubleContainer {
    data: Container;
    init() {
        self.data = Container{
            big1: Big{ x:1,y:2,z:3,s:"a" },
            big2: Big{ x:4,y:5,z:6,s:"b" }
        };
    }
    receive() {
        self.data = Container{
            big1: Big{ x:7,y:8,z:9,s:"c" },
            big2: Big{ x:10,y:11,z:12,s:"d" }
        };
    }
}