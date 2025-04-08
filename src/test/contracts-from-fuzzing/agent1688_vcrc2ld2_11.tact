struct ContainsInts {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

contract TestContract {
    x: ContainsInts;
    y: ContainsInts;
    z: ContainsInts;

    init() {
        self.x = ContainsInts{a:1,b:2,c:3,d:4};
        self.y = ContainsInts{a:5,b:6,c:7,d:8};
        self.z = ContainsInts{a:9,b:10,c:11,d:12};
    }
}