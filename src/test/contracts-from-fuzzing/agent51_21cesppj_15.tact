struct UnusualOrder {
    s: String;
    i: Int;
    b: Bool;
    s2: String;
    i2: Int;
    b2: Bool;
    s3: String;
    i3: Int;
    b3: Bool;
}

contract WeirdLayout {
    data: UnusualOrder;

    init() {
        self.data = UnusualOrder{
            s:"a", i:1, b:true,
            s2:"b", i2:2, b2:false,
            s3:"c", i3:3, b3:true
        };
    }
}