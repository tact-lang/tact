struct InnerOpt {
    a: Int?;
    b: Int;
}

struct OuterOpt {
    inner: InnerOpt?;
    flag: Bool;
}

contract TestOpt {
    receive() {
        // Instance with a non-null inner struct
        let instance1 = OuterOpt {
            inner: InnerOpt { a: 42, b: 7 },
            flag: true
        };

        // Instance with a null inner struct
        let instance2 = OuterOpt {
            inner: null,
            flag: false
        };
    }
}
