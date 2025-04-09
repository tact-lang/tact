struct WithVariousSerialized {
    a: Int as uint3;
    b: Int as int3;
    c: Int as uint64;
    d: Int as int64;
}

contract TestContract {
    v: WithVariousSerialized = WithVariousSerialized{
        a:7, b:-4, c:13, d:-13
    };
}
