contract TestInit {
    init(x: Int) {
        // valid initialization using parameter x
    }

    receive() {
        // valid usage of initOf expression to obtain the StateInit
        let s: StateInit = initOf TestInit(42);
        // Accessing fields to ensure they exist
        let _ = s.code;
        let _ = s.data;
    }
}
