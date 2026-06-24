struct BiggerNestedOptional {
    inner: Inner?;
}

struct Inner {
    deeper: Deeper?;
}

struct Deeper {
    deepest: Deepest?;
}

struct Deepest {
    val: Int?;
}

contract TestContract {
    val: BiggerNestedOptional;

    init() {
        self.val = BiggerNestedOptional {
            inner: Inner {
                deeper: Deeper {
                    deepest: Deepest {
                        val: null
                    }
                }
            }
        };
    }
}