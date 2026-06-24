// Test A2: Global function with wildcard parameter (unused discard)
fun myFunction(_: Int): Int { return 42; }

contract TestGlobalFunction { 
    receive() { 
        let r = myFunction(5);
        dump(r);
    } 
}
