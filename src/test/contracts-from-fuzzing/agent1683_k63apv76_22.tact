struct Base {
    v1: Int;
    v2: Bool;
}

contract TestContract {
    var1: Base = Base{ v1: 100, v2: true };
    var2: Base = Base{ v1: -100, v2: false };
}