struct Recurs1 {
    s2: Recurs2?;
}

struct Recurs2 {
    s3: Recurs3?;
}

struct Recurs3 {
    val: Int;
}

contract OptionalRecursion {
    data: Recurs1;

    init() {
        self.data = Recurs1{
            s2: Recurs2{
                s3: Recurs3{
                    val: 77,
                },
            },
        };
    }
}