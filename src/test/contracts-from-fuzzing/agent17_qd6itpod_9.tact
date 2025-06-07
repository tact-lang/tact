contract Nested {
    receive() {}
}

contract Inner {
    fun getNestedInit() : StateInit {
        return initOf Nested();
    }
    receive() {}
}

contract Outer {
    fun getInnerInit() : StateInit {
        return initOf Inner();
    }
    
    // For demonstration, compare addresses of the inner contract computed in two ways
    receive() {
        let init1: StateInit = initOf Inner();
        let addr1: Address = contractAddress(init1);
        let addr2: Address = contractAddressExt(0, init1.code, init1.data);
        dump(addr1);
        dump(addr2);
    }
}
