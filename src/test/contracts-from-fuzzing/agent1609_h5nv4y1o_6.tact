struct Params {
    x: Int;
    y: Int;
    z: Int;
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
}

contract TestContract {
    params: Params;

    init() {
        self.params = Params{
            x: 1,y:2,z:3,a:4,b:5,c:6,d:7,e:8,f:9,g:10,h:11,i:12,j:13
        };
    }

    receive() {
        self.params = Params{
            x: 10,y:20,z:30,a:40,b:50,c:60,d:70,e:80,f:90,g:100,h:110,i:120,j:130
        };
    }
}