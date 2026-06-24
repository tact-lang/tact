struct StOpt { opt: Int?; }

fun destructureOptional(): Int {
    // Destructure a struct with an optional field and use non-null assertion to access it
    let StOpt { opt } = StOpt { opt: 42 };
    return opt!!;  // Should return 42
}

contract DestructuringOptionalTest {
    receive() {
        destructureOptional();
    }
}
