contract T {
    receive() {
        // Comparing current contract's code obtained via myCode and codeOf
        let c1: Cell = myCode();
        let c2: Cell = codeOf T;
        // Dummy check - in real scenario, one may compare slices
    }
}
