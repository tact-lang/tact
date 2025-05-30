struct Struct1 {
    a: Int;
}
struct Struct2 {
    s1: Struct1;
}
struct Struct3 {
    s2: Struct2;
}

contract TestContract {
    val: Struct3;
    
    init() {
        self.val = Struct3{
            s2: Struct2{
                s1: Struct1{
                    a: 123
                }
            }
        };
    }
}