struct Sub {
    a: Int;
    b: Bool?;
    c: String;
}

struct Outer {
    s1: Sub;
    s2: Sub;
    s3: Sub;
}

contract TestContract {
    persistent: Outer;

    init() {
        let sub = Sub{ a: 1, b: null, c: "hello" };
        self.persistent = Outer{ s1: sub, s2: sub, s3: sub };
    }
}