// deeply nested multiple optional with optionals inside struct fields
struct Inner1 {
    a: Int?;
    b: Bool;
}

struct Inner2 {
    c: Inner1?;
    d: String;
}

struct Container {
    e: Inner2?;
}

contract NestedOptionals {
    f: Container;
    
    init() {
        self.f = Container{
            e: Inner2{
                c: Inner1{
                    a: null,
                    b: true,
                },
                d: "x",
            }
        };
    }
}