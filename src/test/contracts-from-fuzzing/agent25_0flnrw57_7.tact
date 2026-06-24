struct NestOpt {
    child: Int?;
}

struct OuterOpt {
    nested: NestOpt?;
}

contract TestContract {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{
            nested: NestOpt{child: 123}
        };
    }
}