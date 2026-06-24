struct Nested1 {a: Int;}
struct Nested2 {n1: Nested1; b: Bool;}
struct Nested3 {n2: Nested2; s: String;}

contract DeepStack {
    deep: Nested3;
    init() {
        self.deep = Nested3{
            n2: Nested2{
                n1: Nested1{a:5},
                b:true
            },
            s:"x"
        };
    }
}