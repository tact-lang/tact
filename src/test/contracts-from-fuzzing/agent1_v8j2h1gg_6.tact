struct S5 {
    value: Int;
}

struct S4 {
    next: S5;
}

struct S3 {
    next: S4;
}

struct S2 {
    next: S3;
}

struct S1 {
    next: S2;
}

struct S0 {
    next: S1;
}

fun make_chain() : S0 {
    return S0 {
        next: S1 {
            next: S2 {
                next: S3 {
                    next: S4 {
                        next: S5 { value: 999 }
                    }
                }
            }
        }
    };
}

contract TestDeepChain {
    receive() {
        let chain = make_chain();
        dump(chain.next.next.next.next.next.value);
    }
}
