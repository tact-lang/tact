primitive Int;

trait BaseTrait {}

message Add {
    queryId: Int;
    amount: Int;
}

contract Test {
    bounced(msg: bounced<Add>) {
        // ...
    }
}
