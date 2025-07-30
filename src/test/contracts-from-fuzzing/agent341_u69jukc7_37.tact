struct NestOpt {
    s: Nested?;
}

struct Nested {
    i: Int;
    txt: String;
}

contract TestContract {
    val: NestOpt;

    init() {
        self.val = NestOpt{
            s: null
        };
    }
}