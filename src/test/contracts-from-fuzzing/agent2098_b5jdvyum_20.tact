struct Nester1 {
    x: Int;
}

struct Nester2 {
    n1: Nester1;
}

struct Nester3 {
    n2: Nester2;
}

struct Nester4 {
    n3: Nester3;
}

contract NilNullable {
    obj: Nester4? = null;
}
