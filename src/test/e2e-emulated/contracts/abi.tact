import "@stdlib/deploy";

struct S {
    x: Int;
}

struct S2 {
    y: Int;
}

struct S3 {
    z: Int;
}

fun testS3(): Int {
    let s3 = S3 { z: 123 };
    return s3.z;
}

contract A with Deployable {
    receive() {}

    get fun test(): S2 {
        return S2 { y: 123 };
    }
}

contract B with Deployable {
    receive() {
        require(1 == 1, "1 is not equal to 1");
    }

    get fun test1(): Address {
        return contractAddress(initOf A());
    }

    get fun test2(): S {
        return S { x: 123 };
    }
}

contract C with Deployable {
    s: S;

    init () {
        self.s = S { x: 123 };
    }

    get fun test(): S {
        return self.s;
    }
}

contract D with Deployable {
    receive() {}

    get fun test(): Int {
        return testS3();
    }
}