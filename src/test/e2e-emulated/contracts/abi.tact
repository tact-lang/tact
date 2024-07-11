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

struct S4 {
    a: Int;
    s: S;
}

message M1 {
    a: Int;
    s: S4;
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

contract E with Deployable {
    receive() {}

    get fun test(s: S4): Int {
        return s.a;
    }
}

contract F with Deployable {
    receive() {}

    receive(msg: M1) {}
}