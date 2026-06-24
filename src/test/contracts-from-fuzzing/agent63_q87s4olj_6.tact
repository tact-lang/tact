struct OptStruct {
    a: Int;
    b: Int?  // Optional Int
}

contract TestOptional {
    receive() {
        let os = OptStruct{ a: 10, b: 20 };
        dump(os.b);
    }
}
