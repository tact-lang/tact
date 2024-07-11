import "./initof-4-A";

struct S {
    x: Int;
}

contract ContractB {
    x: Int;

    init(x: Int) {
        self.x = x;
    }

    receive () {}

    get fun test(x: Int): Address {
        return contractAddress(initOf ContractA(x));
    }

    get fun testS(): S {
        return S { x: 123 };
    }

    get fun testError(): Int {
        require(1 == 2, "1 is equal to 2");
        return 0;
    }
}