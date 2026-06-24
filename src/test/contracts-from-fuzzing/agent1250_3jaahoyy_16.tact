struct Inner {
    s: String;
}

struct Mid {
    i: Inner;
}

struct Outer {
    m: Mid;
}

contract TestContract {
    nested: Outer = Outer{m: Mid{i: Inner{s:"data"}}};
}