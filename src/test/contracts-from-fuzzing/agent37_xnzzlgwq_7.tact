contract TestGetter2 {
    get fun getValue(): Int {
        { return 42; }  // nested block with explicit return
    }
}
