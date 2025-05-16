contract TestNestedTernary {
    receive() {
        // Evaluates as: false ? 1 : (true ? 2 : 3) => 2
        let result: Int = false ? 1 : true ? 2 : 3;
        dump(result);
    }
}
