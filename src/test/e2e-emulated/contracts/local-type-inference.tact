import "@stdlib/deploy";

contract LocalTypeInferenceTester with Deployable {
    get fun test1(): Int {
        let x = 1;
        return x;
    }

    get fun test2(): Int {
        let x = 1;
        let y = x + 1;
        return y;
    }

    get fun test3(): Address {
        let x = myAddress();
        return x;
    }

    get fun test4(): Address {
        let x = myAddress();
        let y = x;
        return y;
    }

    get fun test5(): Bool {
        let x: Int = 123;
        let y = x == 123;
        return y;
    }
}