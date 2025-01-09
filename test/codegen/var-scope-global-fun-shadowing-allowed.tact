contract TestGlobalFunctionShadowing {
    receive("foo") {
        let sender = sender();
    }
}
