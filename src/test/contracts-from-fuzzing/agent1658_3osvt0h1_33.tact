struct C1 { a: Int; }
struct C2 { a: Int; }
struct C3 { a: Int; }
struct Container {
    s1: C1;
    s2: C2;
    s3: C3;
}
contract ManyNestedIdenticalNames {
    f: Container;
    init() {
        self.f = Container{
            s1:C1{a:1}, s2:C2{a:2}, s3:C3{a:3}
        };
    }
}