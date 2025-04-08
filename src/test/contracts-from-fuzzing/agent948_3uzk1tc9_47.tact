struct Struct1 { a: Int; }
struct Struct2 { s1: Struct1; }
struct Struct3 { s2: Struct2; }

contract CascadeNested {
    data: Struct3;

    init() {
        self.data = Struct3{
            s2: Struct2{
                s1: Struct1{
                    a: 999
                }
            }
        };
    }
}