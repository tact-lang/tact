struct S1 {
    x: Int;
    y: Bool;
}

struct S2 {
    x: S1;
    y: S1;
}

struct S3 {
    x: S2;
    y: S2;
}

contract TestContract {
    data: S3;

    init() {
        self.data = S3{
            x: S2{
                x: S1{x:1,y:true},
                y: S1{x:2,y:false},
            },
            y: S2{
                x: S1{x:3,y:true},
                y: S1{x:4,y:false},
            }
        };
    }
}