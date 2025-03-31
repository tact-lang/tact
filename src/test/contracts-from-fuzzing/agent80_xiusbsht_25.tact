contract Test {
    // Attempt to discard String parameter using underscore in receiver parameter declaration
    // Based on documentation underscore may be used, but our previous test with 'receive(str: _)' failed.
    // Here we try the syntax 'receive(_: String)' to see if it is allowed.
    receive(_: String) {
        // Body intentionally empty
    }
}
