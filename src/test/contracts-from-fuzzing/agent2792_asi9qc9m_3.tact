struct S1 {
    x: Int;
}

struct S2 {
    s1: S1;
    y: String;
}

struct S3 {
    s2: S2;
    z: Cell;
}

contract DeepNested {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{
                s1: S1{
                    x: 10
                },
                y: "ok"
            },
            z: emptyCell()
        };
    }
}