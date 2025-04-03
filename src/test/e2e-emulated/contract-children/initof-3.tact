contract B {
    owner: Address;
    init(addr: Address){
        self.owner = addr;
    }
}

fun get_init(addr: Address): StateInit {
    return initOf B(addr);
}

contract A {
    receive("aa") {
        let c1: StateInit = get_init(myAddress());
        dump(c1.data);
        let c2: StateInit = initOf B(myAddress());
        dump(c2.data);
    }
}
