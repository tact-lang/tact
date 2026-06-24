contract TrailingContract(p: Int) {}

contract Test7 {
    receive() {
        // Using initOf with a trailing comma in the parameters
        let s = initOf TrailingContract(99,);
        let c = codeOf TrailingContract;
        let eq = s.code == c;
    }
}
