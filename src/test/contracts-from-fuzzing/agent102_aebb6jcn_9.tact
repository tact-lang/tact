contract G {
    // Using init() with a parameter, so we use initOf with arguments
    init(x: Int) { }
    receive() {}
}

contract TestTrailingComma {
    receive() {
        // Valid: Using initOf with trailing comma in the parameter list
        let initState = initOf G(42,);
        let codeState = codeOf G;
    }
}
