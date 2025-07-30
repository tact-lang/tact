struct A {
    val: Int;
    next: B?;
}

struct B {
    flag: Bool;
    next: C?;
}

struct C {
    text: String;
    end: D?;
}

struct D {
    n: Int?;
    final: Bool?;
}

contract OptionalNest {
    optData: A?;

    init() {
        self.optData = A{
            val: 5,
            next: B{
                flag: true,
                next: C{
                    text: "end",
                    end: null,
                },
            },
        };
    }
}