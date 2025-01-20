contract contract_0 {
    get fun function_def_1(): Int {
        let x1: Int = 42;
        {
            let x: Int = 42;
            {
                x1 += x;
            }
        }
        return x1;
    }
}
