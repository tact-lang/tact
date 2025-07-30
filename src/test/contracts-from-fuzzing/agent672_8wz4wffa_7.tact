struct S1 {
    x: Int;
}

struct S2 {
    s: S1;
}

struct S3 {
    s: S2;
}

contract VeryDeepNestedParam(
    data: S3
) {
    receive() {
        // Just for test
    }
}