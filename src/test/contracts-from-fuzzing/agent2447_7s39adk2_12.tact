struct Inner {
    a: Int?;
    b: Bool?;
}

struct Outer {
    inn: Inner?;
}

contract DeepOpt {
    o: Outer = Outer{ inn: null };
}