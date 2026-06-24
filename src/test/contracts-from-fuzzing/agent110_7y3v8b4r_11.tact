struct Struct1 { a: Int }
struct Struct2 { s1: Struct1 }
struct Struct3 { s2: Struct2 }
struct Struct4 { s3: Struct3 }
struct Struct5 { s4: Struct4 }

contract Deep5 {
    data: Struct5;

    init() {
        self.data = Struct5{
            s4: Struct4{
                s3: Struct3{
                    s2: Struct2{
                        s1: Struct1{a: 99}
                    }
                }
            }
        };
    }
}