contract TestTypeInference {
    // Testing minimal type inference for integer
    // We expect the compiler to infer the type as Int

    receive() {
        let x = 42;
        // If the compiler works as documented, this should compile without error.
        // This tests if the type is inferred properly.
    }
}