struct OptTest {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
    e: Int;
    f: Int?;
}

contract TestContract {
    field: OptTest = OptTest{
        a: 1,
        b: null,
        c: 3,
        d: null,
        e: 5,
        f: null
    };
}
