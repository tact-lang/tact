struct DeepChainStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

struct NestedDeepChain {
    d1: DeepChainStruct;
    d2: DeepChainStruct;
    d3: DeepChainStruct;
    d4: DeepChainStruct;
    d5: DeepChainStruct;
}

contract DeepNestedChain {
    val: NestedDeepChain;
    init() {
        self.val = NestedDeepChain{
            d1:DeepChainStruct{a:1,b:2,c:3,d:4,e:5},
            d2:DeepChainStruct{a:1,b:2,c:3,d:4,e:5},
            d3:DeepChainStruct{a:1,b:2,c:3,d:4,e:5},
            d4:DeepChainStruct{a:1,b:2,c:3,d:4,e:5},
            d5:DeepChainStruct{a:1,b:2,c:3,d:4,e:5}
        };
    }
}