struct WeirdInts {
    a: Int as int3;
    b: Int as uint3;
    c: Int as int5;
    d: Int as uint5;
}

contract Test {
    data: WeirdInts;
    init() {
        self.data = WeirdInts{a:3,b:3,c:5,d:5};
    }
}