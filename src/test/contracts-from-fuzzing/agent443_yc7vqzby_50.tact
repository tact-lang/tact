struct Compose {
    a: Int;
    b: Bool;
}

struct ContainsCompose {
    first: Compose;
    second: Compose;
}

contract NestedComposed {
    val: ContainsCompose;

    init() {
        self.val = ContainsCompose{
            first: Compose{ a:1, b:true },
            second: Compose{ a:2, b:false }
        };
    }
}
