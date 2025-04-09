struct S1 { f1: Int }
struct S2 { f2: Int }
struct S3 { f3: Int }
struct S4 { f4: Int }
struct S5 { f5: Int }
struct Container {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
}

contract DeepWideNested {
    container: Container;

    init() {
        self.container = Container{
            s1: S1{ f1: 1 },
            s2: S2{ f2: 2 },
            s3: S3{ f3: 3 },
            s4: S4{ f4: 4 },
            s5: S5{ f5: 5 }
        };
    }
}