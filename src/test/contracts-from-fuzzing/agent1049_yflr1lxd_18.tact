struct OptionalChain {
    child: Int?;
}

struct OptionalChain2 {
    link: OptionalChain?;
}

contract NestedOptionals {
    field: OptionalChain2?;

    init() {
        self.field = null;
    }
}