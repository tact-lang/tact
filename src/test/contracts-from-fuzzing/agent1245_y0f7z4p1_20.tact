struct Recursive1 {
    val: Int;
}

struct Recursive2 {
    nest: Recursive1;
    text: String?;
}

struct Recursive3 {
    deep: Recursive2?;
    flag: Bool;
}

contract ChainStructs {
    chain: Recursive3;

    init() {
        self.chain = Recursive3{
            deep: Recursive2{
                nest: Recursive1{
                    val: 42,
                },
                text: null,
            },
            flag: true,
        };
    }
}
