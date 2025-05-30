struct OptStruct {
    F: Int;
    G: Int?;
}

contract TestOpt {
    receive() {
        // Providing a value for the optional field
        let a: OptStruct = OptStruct { F: 10, G: 20 };
        a.G;
    }
}
