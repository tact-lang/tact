struct LongDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Int = 6;
    g: Int = 7;
    h: Int = 8;
    i: Int = 9;
    j: Int = 10;
}

contract LongDefaultsContract {
    data: LongDefaults;

    init() {
        self.data = LongDefaults{};
    }

    receive() {
        self.data = LongDefaults{
            a:10,b:9,c:8,d:7,e:6,f:5,g:4,h:3,i:2,j:1
        };
    }
}