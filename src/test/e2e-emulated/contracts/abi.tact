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

fun testRequire1() {
    require(1 == 1, "1 is not equal to 1");
}

fun testRequire2() {
    require(1 != 2, "1 is equal to 2");
}

contract A {
    receive() {}

    get fun test(): S2 {
        testRequire2();
        return S2 { y: 123 };
    }
}

contract B {
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

contract C {
    s: S;

    init () {
        testRequire1();
        self.s = S { x: 123 };
    }

    get fun test(): S {
        testRequire2();
        return self.s;
    }
}

contract D {
    receive() {}

    get fun test(): Int {
        return testS3();
    }
}

contract E {
    receive() {}

    get fun test(s: S4): Int {
        return s.a;
    }
}

contract F {
    receive() {}

    receive(msg: M1) {}
}