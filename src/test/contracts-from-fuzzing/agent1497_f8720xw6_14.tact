struct Nested1 {
    i: Int;
    opt: Int?;
}

struct Nested2 {
    a: Nested1;
    s: String;
}

struct Nested3 {
    b: Nested2;
    flag: Bool;
}

contract TestContract {
    field: Nested3 = Nested3{
        b: Nested2{
            a: Nested1{ i: 10, opt: null },
            s: "hi"
        },
        flag: false
    };
}