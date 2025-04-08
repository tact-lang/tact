// struct with optional of struct with optionals
struct S2 {
    a: Int?;
    b: Bool?;
}

struct S1 {
    child: S2?;
}

contract OptOfStructWithOpts {
    myfield: S1;

    init() {
        self.myfield = S1{
            child: S2{
                a: null,
                b: null
            }
        };
    }
}