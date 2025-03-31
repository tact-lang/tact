contract AEmpty {
    // A simple contract with empty init
    init() {}
}

contract BEmpty {
    // Another simple contract
    init() {}
}

contract CEmpty {
    // A third simple contract
    init() {}
}

contract NestedExpressions {
    // Tests multiple nested initOf expressions in a single init
    init() {
        // Retrieve the state code of contracts A, B, and C
        let codeA = (initOf AEmpty()).code;
        let codeB = (initOf BEmpty()).code;
        let codeC = (initOf CEmpty()).code;
        
        // Combine the cells in a new cell (chain them together)
        let combined = beginCell()
            .storeSlice(codeA.asSlice())
            .storeSlice(codeB.asSlice())
            .storeSlice(codeC.asSlice())
            .endCell();
        
        // Dummy usage to prevent unused variable warning
        let _dummy = combined;
    }
}

contract GetterNested {
    // Uses initOf in a getter that returns a composite structure
    init() {}
    get fun compositeCode() : Cell {
        // Nesting initOf within a getter
        let aCode = (initOf AEmpty()).code;
        let bCode = (initOf BEmpty()).code;
        return beginCell()
            .storeSlice(aCode.asSlice())
            .storeSlice(bCode.asSlice())
            .endCell();
    }
}
