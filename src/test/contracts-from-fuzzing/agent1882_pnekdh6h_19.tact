struct InnerOne { a: Int; }
struct InnerTwo { b: Bool?; }
struct InnerThree { s: String; }

struct Compose {
    in1: InnerOne;
    in2: InnerTwo;
    in3: InnerThree;
}

contract MultiCompose(
    c: Compose
) {}