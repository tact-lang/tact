contract TestImplicit {
    // Implicit init, no explicit init() declared
    receive() {}
}

contract CallerInitImplicit {
    receive() {
        // Using initOf to get the state initial of TestImplicit
        let st = initOf TestImplicit();
    }
}
