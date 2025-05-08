struct Struct1 {
    i: Int;
}
struct Struct2 {
    s1: Struct1;
    s2: Struct1;
}
struct Struct3 {
    s: Struct2;
}

contract TestContract {
    s3: Struct3;

    init() {
        self.s3 = Struct3{
            s: Struct2{
                s1: Struct1{i:1},
                s2: Struct1{i:2}
            }
        };
    }
}