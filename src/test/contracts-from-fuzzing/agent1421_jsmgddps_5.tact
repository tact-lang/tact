struct Nested1 {
    level: Int;
}

struct Nested2 {
    child: Nested1;
}

struct Nested3 {
    child: Nested2;
}

contract TripleNestedContract {
    nested: Nested3 = Nested3{
        child: Nested2{
            child: Nested1{level: 0}
        }
    };
}