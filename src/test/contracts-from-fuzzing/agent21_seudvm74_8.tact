message MsgA { a: Int; }

contract BounceIgnored {
    state: Int;

    init() {
        self.state = 0;
    }

    bounced(_: bounced<MsgA>) {
       // Using underscore to indicate that we don't need to inspect the bounced message
       self.state = 42;
    }
}
