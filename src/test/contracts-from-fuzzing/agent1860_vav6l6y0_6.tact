struct Inner1 {
    val1: Int;
}

struct Inner2 {
    val2: Int?;
}

struct Container {
    one: Inner1;
    two: Inner2;
}

contract MixNested {
    stored: Container = Container{
        one: Inner1{ val1: 100 },
        two: Inner2{ val2: null }
    };
}