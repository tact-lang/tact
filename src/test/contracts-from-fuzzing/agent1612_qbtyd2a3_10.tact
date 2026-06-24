struct Nested1 {
    val: Int;
}

struct Nested2 {
    f1: Nested1;
    f2: Nested1;
}

struct Nested3 {
    n2: Nested2;
    f3: Int;
}

struct Nested4 {
    n3: Nested3;
    text: String;
}

struct Nested5 {
    n4: Nested4;
    isValid: Bool;
}

contract TestContract {
    data: Nested5;

    init() {
        self.data = Nested5{
            n4: Nested4{
                n3: Nested3{
                    n2: Nested2{
                        f1: Nested1{ val: 1 },
                        f2: Nested1{ val: 2 },
                    },
                    f3: 99,
                },
                text: "hello",
            },
            isValid: false,
        };
    }

    receive() {
        let _ = self.data.isValid;
    }
}