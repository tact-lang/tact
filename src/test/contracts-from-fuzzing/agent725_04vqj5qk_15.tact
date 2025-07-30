struct S1 {
    a: Bool;
}

struct S2 {
    b: String;
}

struct S3 {
    c: Address;
}

contract MixedNestedStructs {
    x: S1;
    y: S2;
    z: S3;

    init() {
        self.x = S1{a:true};
        self.y = S2{b:"ok"};
        self.z = S3{c:myAddress()};
    }
}