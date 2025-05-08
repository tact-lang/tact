contract TestAugAssign {
    receive() {
        // Testing augmented assignment on a variable declared with let
        // According to docs, augmented assignment does not make sense for destructuring assignments,
        // but for simple assignments it should work if the variable is mutable.
        // However, in Tact, variables are immutable by default; to allow mutation, we use the '_' wildcard?
        // Let's try a simple assignment and then augmented assignment by redeclaring it (if allowed).

        // Instead of var, we reassign using a temporary variable which is allowed if declared as let?
        // Actually, since regular 'let' declarations in Tact are immutable, augmented assignment is not expected to work.
        // We test a case and expect a type check or parse error.

        let x: Int = 5;
        // The following augmented assignment should produce a compile error because x is immutable
        x += 10;

        return;
    }
}
