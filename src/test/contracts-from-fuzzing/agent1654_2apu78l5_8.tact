struct S1 {
    x: Int;
}

struct S2 {
    y: S1;
}

struct S3 {
    z: S2;
}

contract TestContract {
    data1: S1;
    data2: S2;
    data3: S3;

    init() {
        self.data1 = S1{x: 10};
        self.data2 = S2{y: S1{x: 20}};
        self.data3 = S3{z: S2{y: S1{x: 30}}};
    }
}