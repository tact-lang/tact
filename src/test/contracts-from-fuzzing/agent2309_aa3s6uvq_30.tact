// nested deeply then convert in constructor
struct S1 { x: Int; }
struct S2 { s1: S1; }
struct S3 { s2: S2; }
struct S4 { s3: S3; }
struct S5 { s4: S4; }

contract ConvertDeep {
    deep: S5;
    init() {
        self.deep = S5{
            s4: S4{
                s3: S3{
                    s2: S2{
                        s1: S1{
                            x: 123
                        }
                    }
                }
            }
        };
        let cell = self.deep.toCell();
        let back = S5.fromCell(cell);
    }
}