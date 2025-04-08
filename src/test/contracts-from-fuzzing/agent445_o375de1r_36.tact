// Struct with optional sub-struct with null initializer
struct Bar {
    i: Int;
}

struct Wrapper {
    bar: Bar?;
}

contract OptionalSubStructInit {
    w: Wrapper = Wrapper{
        bar: null
    };
}
