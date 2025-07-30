///////////////////////////////
// Test 9: Inline function defined at contract level using initOf
///////////////////////////////

contract ChildA {
    init() { }
}

inline fun generateChildAInit() : StateInit {
    return initOf ChildA();
}

contract Parent {
    init() {
        // Using inline function defined outside contract
        let pkg1 = generateChildAInit();
        let pkg2 = initOf ChildA();
    }
    
    get fun getInitChildA() : StateInit {
        return generateChildAInit();
    }
}
