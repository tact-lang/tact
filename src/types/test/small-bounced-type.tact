primitive Int;
primitive Bool;

trait BaseTrait {}

message Add {
    queryId: Int;
    amount: Int;
}

message Is {
    val: Bool;
}

contract Test {
    bounced(msg: bounced<Add>) {
        // ...
    }

    bounced(msg: bounced<Is>) {
        // ...
    }
}
