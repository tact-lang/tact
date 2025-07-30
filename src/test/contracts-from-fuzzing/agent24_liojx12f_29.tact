// Flat struct with int,bool,string
struct Flat {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    f: Flat = Flat{a: 5, b: false, c: "x"};
    init() {}
}