contract TestCombinedExpressions {
    receive() {
        // This expression combines several operators and conditional expressions:
        // (2+3) * (4-1) + (true ? 10 : 20) - (false ? 5 : 3)
        // Evaluate step by step:
        // (2+3) = 5, (4-1) = 3, so 5*3 = 15
        // (true ? 10 : 20) yields 10; (false ? 5 : 3) yields 3
        // Expression becomes: 15 + 10 - 3 = 22
        let v: Int = (2 + 3) * (4 - 1) + (true ? 10 : 20) - (false ? 5 : 3);
        dump(v);
    }
}
