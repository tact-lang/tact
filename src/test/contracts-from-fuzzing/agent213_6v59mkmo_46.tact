struct Inner {
    x: Int?;
}

struct Outer {
    inn: Inner; // Contains optional without default
}

contract Bad {
    s: Outer = Outer{ inn: Inner{} };
}