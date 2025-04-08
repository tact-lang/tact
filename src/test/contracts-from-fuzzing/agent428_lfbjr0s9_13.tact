// variant to test deep nesting combined with optionals in fields
struct Third {
    val: Int;
}

struct Second {
    inner: Third?;
}

struct First {
    second: Second?;
}

contract TestContract {
    data: First;

    init() {
        self.data = First{
            second: Second {
                inner: Third {
                    val: 777
                }
            }
        };
    }
}