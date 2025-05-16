struct III {
    a: Int;
    b: Int;
    c: Int;
}

contract ManyIntVars {
    v1: III;
    v2: III;
    v3: III;
    v4: III;
    v5: III;
    v6: III;

    init() {
        self.v1 = III{a:1,b:2,c:3};
        self.v2 = III{a:4,b:5,c:6};
        self.v3 = III{a:7,b:8,c:9};
        self.v4 = III{a:10,b:11,c:12};
        self.v5 = III{a:13,b:14,c:15};
        self.v6 = III{a:16,b:17,c:18};
    }
}