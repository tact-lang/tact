contract TrailingCommaInit {
    init(
        param1: Int, // trailing comma allowed
    ) {
        // trivial assignment
        let x = param1 + 1;
    }
}
