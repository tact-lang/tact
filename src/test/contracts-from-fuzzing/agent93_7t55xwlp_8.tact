struct WithDefaultOptional {
    a: Int;
    b: String? = null;
}

contract DefaultOptionalTest {
    s: WithDefaultOptional = WithDefaultOptional{ a: 5 };
}