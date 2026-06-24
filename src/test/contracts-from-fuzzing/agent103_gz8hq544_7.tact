contract TrailingComma(param: Int) {
    receive() {
        // Using trailing comma in initOf invocation
        let s = initOf TrailingComma(42,);
        let c = codeOf TrailingComma;
    }
}
