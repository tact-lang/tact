message(0x1) A { x: Int }
message(0x2) B { y: Int }

struct HasMessages {
    a: A;
    b: B;
}

contract ParamsTest(
    inner: HasMessages,
    optA: A?,
    optB: B?
) {}