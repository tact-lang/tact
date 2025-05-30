struct Inner1 {
    a: Int?;
}

struct Inner2 {
    b: Inner1?;
}

struct Inner3 {
    c: Inner2?;
}

struct Inner4 {
    d: Inner3?;
}

contract DeepChainOptional {
    chain: Inner4? = null;
}