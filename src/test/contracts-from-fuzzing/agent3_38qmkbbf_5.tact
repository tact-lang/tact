struct Level3Opt {
    field: Int;
}

struct Level2Opt {
    nested: Level3Opt?;
}

struct Level1Opt {
    opt: Level2Opt?;
}

contract TestOptionalNested {
    receive() {
        // Deeply nested optional instantiation
        let x = Level1Opt{
            opt: Level2Opt{
                nested: Level3Opt{
                    field: 99,
                },
            },
        };
    }
}
