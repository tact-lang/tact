contract DeepPersistent {
    nested: Outer1;

    init() {
        self.nested = Outer1{
            a: Outer2{
                a: Outer3{
                    a: Outer4{
                        a: 42
                    }
                }
            }
        };
    }
}

struct Outer1{ a: Outer2 }
struct Outer2{ a: Outer3 }
struct Outer3{ a: Outer4 }
struct Outer4{ a: Int }
