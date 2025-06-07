struct Innermost {
    foo: String;
}

struct Mid {
    innermost: Innermost?;
}

contract TestContract {
    m: Mid?;
}