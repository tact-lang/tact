contract SelfCodeComparison {
    receive() {
        // Compare the on-chain code via myCode() with the compile-time computed code of SelfCodeComparison
        require(myCode() == codeOf SelfCodeComparison, "Code mismatch");
    }
}

contract ComplexInline {
    inline fun getInit() : StateInit {
        // Return its own initialization package
        return initOf ComplexInline();
    }
    receive() {
        let pkg = self.getInit();
        let addr = contractAddress(pkg);
        require(addr == myAddress(), "Complex inline self-reference failed");
    }
}

contract DynamicParam(x: Int) {
    receive() {}
}

contract CallerDynamic {
    receive() {
        let a: Int = 42;
        // Passing a variable to initOf: since 'a' is known at compile-time in this context, it should work
        let pkg = initOf DynamicParam(a);
    }
}
